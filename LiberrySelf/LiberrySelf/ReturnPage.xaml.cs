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
    /// Логика взаимодействия для ReturnPage.xaml
    /// </summary>
    public partial class ReturnPage : Window
    {
        public ReturnPage() => InitializeComponent();

        // Проверка ввода
        private void CheckInputs() => ReturnButton.IsEnabled =
            !string.IsNullOrWhiteSpace(BookID.Text) &&
            !string.IsNullOrWhiteSpace(Name.Text) &&
            !string.IsNullOrWhiteSpace(Phone.Text);

        // Кнопка "Вернуть"
        private void ReturnButton_Click(object sender, RoutedEventArgs e)
        {
            using ( var db = new LibraryBD()) ;
            var rent = db.Rents.FirstOrDefault(r => r.BookId == int.Parse(BookID.Text) && r.FullName == Name.Text);
            if (rent != null)
            {
                db.Rents.Remove(rent);
                db.SaveChanges();
            }
            Close();
        }
    }
}

