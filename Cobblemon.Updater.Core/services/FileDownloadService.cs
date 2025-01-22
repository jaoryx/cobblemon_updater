using Cobblemon.Updater.Core.classes;
using Newtonsoft.Json;
using System.Net;

namespace Cobblemon.Updater.Core.services
{
    public class FileDownloadService
    {
        private string versionPasteBin = "https://pastebin.com/raw/1yFq8tPq";
        private string modpackPasteBin = "https://pastebin.com/raw/nm4jLKUk";
        private string exeLocation = Directory.GetCurrentDirectory();
        private string configsLocation;
        public FileDownloadService()
        {
            configsLocation = Path.Combine(exeLocation, "Configs");
        }

        private string DownloadString(string pasteBin)
        {
            WebClient webClient = new WebClient();
            string downloadedString = webClient.DownloadString(pasteBin);
            webClient.Dispose();
            return downloadedString;
        }

        public void SaveLocalConfig(JsonConfig config)
        {
            if (!Directory.Exists(configsLocation))
            {
                Directory.CreateDirectory(configsLocation);
            }

            string json = JsonConvert.SerializeObject(config, Formatting.Indented);
            File.WriteAllText(Path.Combine(configsLocation, $"{config.Version}.txt"), json);
        }

        public JsonConfig GetCurrentConfig()
        {
            if (!Directory.Exists(configsLocation))
            {
                Directory.CreateDirectory(configsLocation);
            }
            DirectoryInfo directoryInfo = new DirectoryInfo(configsLocation);
            FileInfo latestConfig = directoryInfo.GetFiles("*.txt").OrderByDescending(f => f.LastWriteTime).FirstOrDefault();
            string jsonConfig;
            if (latestConfig == null)
            {
                JsonConfig config = JsonConvert.DeserializeObject<JsonConfig>("{\"version\":\"1.0\"}");
                SaveLocalConfig(config);
                return config;
            }
            else
            {
                jsonConfig = File.ReadAllText(latestConfig.FullName);
                return JsonConvert.DeserializeObject<JsonConfig>(jsonConfig);
            }
        }

        public JsonConfig GetToUpdateConfig()
        {
            string pasteBinContent = DownloadString(versionPasteBin);
            return JsonConvert.DeserializeObject<JsonConfig>(pasteBinContent);
        }

        public void ResetConfigs()
        {
            if (Directory.Exists(configsLocation))
            {
                Directory.Delete(configsLocation, true);
            }
        }

        public string GetModPackDownloadLink()
        {
            return DownloadString(modpackPasteBin);
        }
    }
}
