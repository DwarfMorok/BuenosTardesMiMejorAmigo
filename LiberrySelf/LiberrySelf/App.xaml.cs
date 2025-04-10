using System;
using System.Windows;

namespace LibraryApp
{
    public partial class App : Application
    {
        protected override void OnStartup(StartupEventArgs e)
        {
            AppDomain.CurrentDomain.UnhandledException += (sender, args) =>
            {
                Exception ex = (Exception)args.ExceptionObject;
                MessageBox.Show($"Произошла непредвиденная ошибка: {ex.Message}", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                // Здесь можно добавить логирование в файл
            };

            base.OnStartup(e);
        }
    }
}
