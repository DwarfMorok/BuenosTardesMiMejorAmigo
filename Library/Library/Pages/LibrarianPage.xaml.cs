using System;
using System.Data;
using System.Data.SqlClient;
using System.Windows;
using System.Windows.Controls;
using Xceed.Words.NET;
using System.Linq;

namespace LibrarySelfService.Pages
{
    public partial class LibrarianPage : Page
    {
        private Frame _mainFrame;

        public LibrarianPage(Frame mainFrame)
        {
            InitializeComponent();
            _mainFrame = mainFrame;
            LoadBooksData();
        }

        private void LoadBooksData()
        {
            try
            {
                using (SqlConnection conn = new SqlConnection("Data Source=localhost\\SQLEXPRESS;Initial Catalog=LibraryBD;Integrated Security=True"))
                {
                    conn.Open();
                    SqlDataAdapter adapter = new SqlDataAdapter("SELECT * FROM Books", conn);
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);
                    BooksGrid.ItemsSource = dt.DefaultView;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка загрузки данных: " + ex.Message);
            }
        }

        // Добавление книги
        private void AddBook_Click(object sender, RoutedEventArgs e)
        {
            string title = TitleBox.Text;
            string author = AuthorBox.Text;
            string genre = GenreBox.Text;
            string yearPublished = YearBox.Text;
            bool availabilityStatus = AvailabilityBox.IsChecked ?? true;

            if (string.IsNullOrEmpty(title) || string.IsNullOrEmpty(author) || string.IsNullOrEmpty(genre) || string.IsNullOrEmpty(yearPublished))
            {
                MessageBox.Show("Все поля должны быть заполнены.");
                return;
            }

            try
            {
                using (SqlConnection conn = new SqlConnection("Data Source=localhost\\SQLEXPRESS;Initial Catalog=LibraryBD;Integrated Security=True"))
                {
                    conn.Open();
                    string query = "INSERT INTO Books (Title, Author, Genre, YearPublished, AvailabilityStatus) VALUES (@Title, @Author, @Genre, @YearPublished, @AvailabilityStatus)";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@Title", title);
                    cmd.Parameters.AddWithValue("@Author", author);
                    cmd.Parameters.AddWithValue("@Genre", genre);
                    cmd.Parameters.AddWithValue("@YearPublished", yearPublished);
                    cmd.Parameters.AddWithValue("@AvailabilityStatus", availabilityStatus);

                    cmd.ExecuteNonQuery();
                }
                LoadBooksData();
                MessageBox.Show("Книга добавлена.");
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка добавления книги: " + ex.Message);
            }
        }

        // Удаление книги
        private void DeleteBook_Click(object sender, RoutedEventArgs e)
        {
            if (BooksGrid.SelectedItem == null)
            {
                MessageBox.Show("Выберите книгу для удаления.");
                return;
            }

            DataRowView selectedRow = (DataRowView)BooksGrid.SelectedItem;
            int bookId = (int)selectedRow["BookId"]; // Замените на ID вашей книги

            try
            {
                using (SqlConnection conn = new SqlConnection("Data Source=localhost\\SQLEXPRESS;Initial Catalog=LibraryBD;Integrated Security=True"))
                {
                    conn.Open();
                    string query = "DELETE FROM Books WHERE BookId = @BookId";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@BookId", bookId);
                    cmd.ExecuteNonQuery();
                }
                LoadBooksData();
                MessageBox.Show("Книга удалена.");
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка удаления книги: " + ex.Message);
            }
        }

        // Генерация отчета
        private void GenerateReport_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                // Создаем новый DOCX файл
                using (DocX doc = DocX.Create("LibraryReport.docx"))
                {
                    // Добавляем заголовок
                    var document = DocX.Create("report.docx");

                    // Вставка параграфа с выравниванием по центру
                    var paragraph = document.InsertParagraph("Отчет библиотеки")
    .FontSize(18)
    .Bold();

                    // Устанавливаем выравнивание параграфа
                    paragraph.Alignment = Alignment.center;


                    // Добавляем таблицу книг
                    var booksTable = doc.AddTable(1, 5);
                    booksTable.Rows[0].Cells[0].Paragraphs[0].Append("ID");
                    booksTable.Rows[0].Cells[1].Paragraphs[0].Append("Название");
                    booksTable.Rows[0].Cells[2].Paragraphs[0].Append("Автор");
                    booksTable.Rows[0].Cells[3].Paragraphs[0].Append("Жанр");
                    booksTable.Rows[0].Cells[4].Paragraphs[0].Append("Год публикации");

                    using (SqlConnection conn = new SqlConnection("Data Source=localhost\\SQLEXPRESS;Initial Catalog=LibraryBD;Integrated Security=True"))
                    {
                        conn.Open();
                        SqlDataAdapter adapter = new SqlDataAdapter("SELECT * FROM Books", conn);
                        DataTable dt = new DataTable();
                        adapter.Fill(dt);

                        foreach (DataRow row in dt.Rows)
                        {
                            var newRow = booksTable.InsertRow();
                            newRow.Cells[0].Paragraphs[0].Append(row["BookId"].ToString());
                            newRow.Cells[1].Paragraphs[0].Append(row["Title"].ToString());
                            newRow.Cells[2].Paragraphs[0].Append(row["Author"].ToString());
                            newRow.Cells[3].Paragraphs[0].Append(row["Genre"].ToString());
                            newRow.Cells[4].Paragraphs[0].Append(row["YearPublished"].ToString());
                        }
                    }

                    doc.Save();
                }

                MessageBox.Show("Отчет сгенерирован успешно.");
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка генерации отчета: " + ex.Message);
            }
        }

        private void Back_Click(object sender, RoutedEventArgs e)
        {
            _mainFrame.Navigate(new MainMenuPage(_mainFrame));
        }
    }
}
