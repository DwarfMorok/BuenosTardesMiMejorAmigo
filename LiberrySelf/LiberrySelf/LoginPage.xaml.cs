using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace LiberrySelf
{
    /// <summary>
    /// Логика взаимодействия для LoginPage.xaml
    /// </summary>
    public partial class LoginPage : Window
    {
        private string captchaCode;
        private int failAttempts = 0;

        public LoginPage()
        {
            InitializeComponent();
            GenerateCaptcha();
        }

        // Генерация капчи
        private void GenerateCaptcha()
        {
            var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            var rand = new Random();
            captchaCode = new string(Enumerable.Range(0, 6).Select(x => chars[rand.Next(chars.Length)]).ToArray());
            CaptchaText.Text = captchaCode;
        }

        // Кнопка "Войти"
        private void LoginButton_Click(object sender, RoutedEventArgs e)
        {
            using (var db = new LibraryBD()) ;
            var user = db.Librarians.FirstOrDefault(l => l.Login == Login.Text && l.Password == Password.Password);

            if (user != null)
            {
                new LibrarianPage().Show();
                Close();
            }
            else
            {
                failAttempts++;
                MessageBox.Show("Неверный логин или пароль");
                if (failAttempts >= 1 && CaptchaInput.Text != captchaCode)
                {
                    MessageBox.Show("Капча введена неверно");
                    GenerateCaptcha();
                }
            }
        }
    }
}