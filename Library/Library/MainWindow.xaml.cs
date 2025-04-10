using System.Windows;
using LibrarySelfService.Pages;

namespace LibrarySelfService
{
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            MainFrame.Navigate(new MainMenuPage(MainFrame));
        }
    }
}
