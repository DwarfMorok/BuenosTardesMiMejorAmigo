using System.Windows.Controls;

namespace LibrarySelfService.Pages
{
    public partial class StubPage : Page
    {
        private Frame _mainFrame;

        public StubPage(Frame mainFrame, string title)
        {
            InitializeComponent();
            _mainFrame = mainFrame;
            StubText.Text = $"Страница \"{title}\" в разработке.";
        }

        private void Back_Click(object sender, System.Windows.RoutedEventArgs e) =>
            _mainFrame.Navigate(new MainMenuPage(_mainFrame));
    }
}