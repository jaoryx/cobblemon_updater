using System.IO.Compression;
using System.Diagnostics;
using System.Net;

namespace Cobblemon.Updater.Core.services
{
    public class UpdaterService
    {
        public string modPackName = "Cobblemon Modpack [NeoForge] 1.6";
        private string[] windowTitles = { "Cobblemon 1.20.1", "Minecraft: NeoForge Loading..." };
        private string minecraftPath = Path.Join(Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData), ".minecraft");
        private string versionsPath, modPackPath, modsFolderPath, tempDownloadsFolder = Path.Join(Directory.GetCurrentDirectory(), "Mods");

        public UpdaterService()
        {
            versionsPath = Path.Join(minecraftPath, "versions");
            modPackPath = Path.Join(versionsPath, modPackName);
            modsFolderPath = Path.Join(modPackPath, "mods");
        }

        public bool IsModpackInstalled()
        {
            if (Directory.Exists(modPackPath))
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public bool IsCobblemonRunning()
        {
            bool isRunning = false;

            Process[] processes = Process.GetProcesses();

            foreach (Process process in processes) 
            {
                if (Array.IndexOf(windowTitles, process.MainWindowTitle) > -1)
                {
                    isRunning = true;
                    break;
                }
            }

            return isRunning;
        }

        public void RemoveMod(string modName)
        {
            string modLocation = Path.Join(modsFolderPath, modName);
            if (File.Exists(modLocation))
            {
                File.Delete(modLocation);
            }
        }

        public void InstallModpack(string modPackLink)
        {
            if (!Directory.Exists(tempDownloadsFolder))
            {
                Directory.CreateDirectory(tempDownloadsFolder);
            }

            string fileName = $"{modPackName}.zip";
            string tempLocation = Path.Join(tempDownloadsFolder, fileName);

            WebClient webClient = new WebClient();
            webClient.DownloadFile(modPackLink, tempLocation);
            webClient.Dispose();
            
            if (!Directory.Exists(modPackPath))
            {
                Directory.CreateDirectory(modPackPath);
            }

            string locationToGo = Path.Join(modPackPath, fileName);
            File.Move(tempLocation, locationToGo);

            ZipFile.ExtractToDirectory(locationToGo, modPackPath);

            File.Delete(locationToGo);
        }

        public void InstallMod(string modLink)
        {
            if (!Directory.Exists(tempDownloadsFolder))
            {
                Directory.CreateDirectory(tempDownloadsFolder);
            }

            // Get file name of the mod by the link & set temp location
            string fileName = modLink.Substring(modLink.LastIndexOf("/"), modLink.Length - modLink.LastIndexOf("/"));
            string tempLocation = Path.Join(tempDownloadsFolder, fileName);

            // Download the mod
            WebClient webClient = new WebClient();
            webClient.DownloadFile(modLink, tempLocation);
            webClient.Dispose();

            // Move file from temp location to the modpack folder of Cobblemon but delete first if exists
            string locationToGo = Path.Join(modsFolderPath, fileName);
            if (File.Exists(locationToGo))
            {
                File.Delete(locationToGo);
            }
            File.Move(tempLocation, locationToGo);
        }

        public void DeleteModpack()
        {
            Directory.Delete(modPackPath, true);
        }
    }
}
