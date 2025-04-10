using System;
using System.Data.SqlClient;
using System.Text;
using System.Windows;
using System.Windows.Controls;

namespace LibrarySelfService.Pages
{
    public partial class AuthPage : Page
    {
        private Frame _mainFrame;
        private string _captcha;

        public AuthPage(Frame mainFrame)
        {
            InitializeComponent();
            _mainFrame = mainFrame;
            GenerateCaptcha();
        }

        private void GenerateCaptcha()
        {
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            var rand = new Random();
            var sb = new StringBuilder();
            for (int i = 0; i < 6; i++)
                sb.Append(chars[rand.Next(chars.Length)]);
            _captcha = sb.ToString();
            CaptchaText.Text = _captcha;
        }

        private void RefreshCaptcha_Click(object sender, RoutedEventArgs e) => GenerateCaptcha();

        private void Login_Click(object sender, RoutedEventArgs e)
        {
            if (CaptchaInput.Text != _captcha)
            {
                StatusText.Text = "Неверная капча.";
                GenerateCaptcha();
                return;
            }

            string login = LoginBox.Text;
            string password = PasswordBox.Password;

            try
            {
                using (SqlConnection conn = new SqlConnection("Data Source=localhost\\SQLEXPRESS;Initial Catalog=LibraryBD;Integrated Security=True"))
                {
                    conn.Open();
                    string query = "SELECT COUNT(*) FROM Librarian WHERE Login = @login AND Password = @password";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@login", login);
                    cmd.Parameters.AddWithValue("@password", password);

                    int result = (int)cmd.ExecuteScalar();
                    if (result > 0)
                    {
                        StatusText.Text = "Успешный вход!";
                        _mainFrame.Navigate(new LibrarianPage(_mainFrame));
                    }
                    else
                    {
                        StatusText.Text = "Неверный логин или пароль.";
                    }
                }
            }
            catch (Exception ex)
            {
                StatusText.Text = "Ошибка подключения к БД: " + ex.Message;
            }
        }
    }
}
