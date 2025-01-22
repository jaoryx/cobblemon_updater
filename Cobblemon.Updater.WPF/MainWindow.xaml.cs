using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using System.Windows.Media;
using Cobblemon.Updater.Core.services;
using Cobblemon.Updater.Core.classes;

namespace Cobblemon.Updater.WPF
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        BrushConverter bc = new BrushConverter();
        Brush foreGroundColor, backGroundColor;

        UpdaterService updaterService;
        FileDownloadService fileDownloadService;

        JsonConfig currentConfig, downloadedConfig;

        bool isModpackInstalled = false, isUpdateAvailable = false;
        
        public MainWindow()
        {
            InitializeComponent();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            foreGroundColor = (Brush)bc.ConvertFrom("#FFCDCFD2");
            backGroundColor = (Brush)bc.ConvertFrom("#FF1E2430");

            updaterService = new UpdaterService();
            fileDownloadService = new FileDownloadService();

            UpdateControls();
        }

        private void BtnInstallMods_Click(object sender, RoutedEventArgs e)
        {
            if(updaterService.IsCobblemonRunning())
            {
                ShowErrorMessage("You will need to close any instances of Cobblemon to update!");
                return;
            }

            foreach (string mod in downloadedConfig.ModsRemoved)
            {
                updaterService.RemoveMod(mod);
            }

            string initialMessage = txtFeedback.Text;
            int counter = 0;
            UpdateFeedback(initialMessage + $"\n{counter}/{downloadedConfig.ModsAdded.Length}");

            foreach (string mod in downloadedConfig.ModsAdded)
            {
                updaterService.InstallMod(mod);
                counter++;
                UpdateFeedback(initialMessage + $"\n{counter}/{downloadedConfig.ModsAdded.Length} mods installed");
            }

            fileDownloadService.SaveLocalConfig(downloadedConfig);
            UpdateControls();
        }

        private void BtnDeleteModpack_Click(object sender, RoutedEventArgs e)
        {
            if (updaterService.IsCobblemonRunning())
            {
                ShowErrorMessage("You will need to close any instances of Cobblemon to update!");
                return;
            }

            MessageBoxResult del = MessageBox.Show($"Are you sure you want to delete {updaterService.modPackName}?\nThis will also delete all your waypoints!", "Delete modpack", MessageBoxButton.YesNo, MessageBoxImage.Warning);
            if (del == MessageBoxResult.Yes) 
            {
                updaterService.DeleteModpack();
                fileDownloadService.ResetConfigs();
                UpdateControls();
            }
        }

        private void BtnInstallModpack_Click(object sender, RoutedEventArgs e)
        {
            string modPackLink = fileDownloadService.GetModPackDownloadLink();
            updaterService.InstallModpack(modPackLink);
            UpdateControls();
        }

        private void MouseHoverButton(object sender, MouseEventArgs e)
        {
            Button button = sender as Button;
            if (button.Foreground == Brushes.White)
            {
                button.Foreground = foreGroundColor;
                button.Background = backGroundColor;
                Mouse.OverrideCursor = Cursors.Arrow;
            }
            else
            {
                button.Foreground = Brushes.White;
                button.Background = foreGroundColor;
                Mouse.OverrideCursor = Cursors.Hand;
            }
        }


        private void UpdateControls()
        {
            currentConfig = fileDownloadService.GetCurrentConfig();
            downloadedConfig = fileDownloadService.GetToUpdateConfig();

            isModpackInstalled = updaterService.IsModpackInstalled();

            StringBuilder sb = new StringBuilder();
            sb.AppendLine($"Current version: {currentConfig.Version}");
            sb.AppendLine($"Remote version: {downloadedConfig.Version}");
            if (downloadedConfig.Version != currentConfig.Version && isModpackInstalled)
            {
                isUpdateAvailable = true;
                sb.AppendLine($"Modpack is currently installed but outdated.");
            }
            else if (downloadedConfig.Version == currentConfig.Version && isModpackInstalled)
            {
                isUpdateAvailable = false;
                sb.AppendLine($"Modpack is currently installed and up to date.");
            }
            else if (!isModpackInstalled)
            {
                isUpdateAvailable = false;
                sb.AppendLine($"Modpack is currently not installed.");
            }
            sb.AppendLine(new string('=', 20));
            UpdateFeedback(sb.ToString());

            btnInstallModpack.IsEnabled = !isModpackInstalled;
            btnDeleteModpack.IsEnabled = isModpackInstalled;
            btnInstallMods.IsEnabled = isUpdateAvailable;
        }

        private void UpdateFeedback(string msg)
        {
            txtFeedback.Text = msg;
        }

        private void ShowErrorMessage(string msg)
        {
            MessageBox.Show(msg, "ERROR", MessageBoxButton.OK, MessageBoxImage.Error);
        }

        private void ShowMessage(string msg, string? title)
        {
            MessageBox.Show(msg, title == null ? "" : title);
        }
    }
}