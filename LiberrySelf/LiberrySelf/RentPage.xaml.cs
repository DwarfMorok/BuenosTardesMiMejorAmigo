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
    /// Логика взаимодействия для RentPage.xaml
    /// </summary>
    public partial class RentPage : Window
    {
        public RentPage()
        {
            InitializeComponent();
        }

        // Проверка ввода всех данных
        private void CheckInputs() => RentButton.IsEnabled =
            !string.IsNullOrWhiteSpace(BookID.Text) &&
            !string.IsNullOrWhiteSpace(Name.Text) &&
            !string.IsNullOrWhiteSpace(Phone.Text) &&
            ReturnDate.SelectedDate != null;

        // Кнопка "Арендовать"
        private void RentButton_Click(object sender, RoutedEventArgs e)
        {
            using ( var db = new LibraryBD()) ;
            db.Rents.Add(new Rent
            {
                BookId = int.Parse(BookID.Text),
                FullName = Name.Text,
                Phone = Phone.text,
                DueDate = ReturnDate.SelectedDate.Value
            });
            db.SaveChanges();
            Close();
        }
    }
}