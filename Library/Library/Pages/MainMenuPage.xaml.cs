using System.Windows.Controls;
using LibrarySelfService.Pages;

namespace LibrarySelfService.Pages
{
    public partial class MainMenuPage : Page
    {
        private Frame _mainFrame;

        public MainMenuPage(Frame mainFrame)
        {
            InitializeComponent();
            _mainFrame = mainFrame;
        }

        private void Rent_Click(object sender, System.Windows.RoutedEventArgs e) =>
            _mainFrame.Navigate(new StubPage(_mainFrame, "Аренда"));

        private void Return_Click(object sender, System.Windows.RoutedEventArgs e) =>
            _mainFrame.Navigate(new StubPage(_mainFrame, "Возврат"));

        private void Fine_Click(object sender, System.Windows.RoutedEventArgs e) =>
            _mainFrame.Navigate(new StubPage(_mainFrame, "Штраф"));

        private void Database_Click(object sender, System.Windows.RoutedEventArgs e) =>
            _mainFrame.Navigate(new AuthPage(_mainFrame));
    }
}