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
    /// Логика взаимодействия для LibrarianPage.xaml
    /// </summary>
    public partial class LibrarianPage : Window
    {
        public LibrarianPage()
        {
            InitializeComponent();
            LoadBooks();
        }

        // Загрузка списка книг
        private void LoadBooks()
        {
            using var db = new LibraryBD();
            BooksList.ItemsSource = db.Books.ToList();
        }

        // Добавление новой книги
        private void AddButton_Click(object sender, RoutedEventArgs e)
        {
            using var db = new LibraryBD();
            db.Books.Add(new Book
            {
                Id = int.Parse(BookId.Text),
                Title = TitleBox.Text,
                Genre = GenreBox.Text,
                Year = int.Parse(YearBox.Text)
            });
            db.SaveChanges();
            LoadBooks();
        }

        // Удаление выбранной книги
        private void DeleteButton_Click(object sender, RoutedEventArgs e)
        {
            if (BooksList.SelectedItem is Book book)
            {
                using var db = new LibraryBD();
                db.Books.Remove(db.Books.Find(book.Id));
                db.SaveChanges();
                LoadBooks();
            }
        }

        // Формирование отчета в Word
        private void ReportButton_Click(object sender, RoutedEventArgs e)
        {
            using var db = new LibraryBD();
            var books = db.Books.ToList();
            string path = $"report_{DateTime.Now:yyyyMMdd}.docx";

            using var wordDoc = WordprocessingDocument.Create(path, DocumentFormat.OpenXml.WordprocessingDocumentType.Document);
            var mainPart = wordDoc.AddMainDocumentPart();
            mainPart.Document = new Document();
            var body = mainPart.Document.AppendChild(new Body());
            var table = new Table();

            // Заголовки
            var headerRow = new TableRow();
            headerRow.Append(new TableCell(new Paragraph(new Run("ID"))));
            headerRow.Append(new TableCell(new Paragraph(new Run("Название"))));
            headerRow.Append(new TableCell(new Paragraph(new Run("Жанр"))));
            headerRow.Append(new TableCell(new Paragraph(new Run("Год"))));
            table.Append(headerRow);

            foreach (var b in books)
            {
                var row = new TableRow();
                row.Append(new TableCell(new Paragraph(new Run(b.Id.ToString()))));
                row.Append(new TableCell(new Paragraph(new Run(b.Title))));
                row.Append(new TableCell(new Paragraph(new Run(b.Genre))));
                row.Append(new TableCell(new Paragraph(new Run(b.Year.ToString()))));
                table.Append(row);
            }

            body.Append(table);
            wordDoc.Close();
            MessageBox.Show("Отчёт сформирован: " + path);
        }
    }

    // Модели (Book, Rent, Fine, Librarian)
    public class Book { public int Id { get; set; } public string Title { get; set; } public string Genre { get; set; } public int Year { get; set; } }
    public class Rent { public int Id { get; set; } public int BookId { get; set; } public string FullName { get; set; } public string Phone { get; set; } public DateTime DueDate { get; set; } }
    public class Fine { public int Id { get; set; } public string FineNumber { get; set; } public decimal Amount { get; set; } public string Phone { get; set; } }
    public class Librarian { public int Id { get; set; } public string Login { get; set; } public string Password { get; set; } }

    public class LibraryBD : DbContext
    {
        public DbSet<Book> Books { get; set; }
        public DbSet<Rent> Rents { get; set; }
        public DbSet<Fine> Fines { get; set; }
        public DbSet<Librarian> Librarians { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder options)
            => options.UseSqlServer("YourConnectionStringHere");
    }
