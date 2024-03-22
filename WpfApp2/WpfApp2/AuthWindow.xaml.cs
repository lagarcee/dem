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
using WpfApp2;

namespace wpfapp
{
    /// <summary>
    /// Логика взаимодействия для AuthWindow.xaml
    /// </summary>
    public partial class AuthWindow : Window
    {
        public AuthWindow()
        {
            InitializeComponent();
        }

        private void Button_Auth_Click(object sender, RoutedEventArgs e)
        {
            string login = TextBoxLogin.Text.Trim();
            string pass = PasswordBox.Password.Trim();

            if (login.Length < 6)
            {
                TextBoxLogin.ToolTip = "Поле заполнено не корректно";
                TextBoxLogin.Background = Brushes.Red;
            }
            else if (pass.Length < 6)
            {
                PasswordBox.ToolTip = "Поле заполнено не корректно";
                PasswordBox.Background = Brushes.Red;
            }
            else
            {
                TextBoxLogin.Background = Brushes.Transparent;
                TextBoxLogin.ToolTip = "";

                PasswordBox.Background = Brushes.Transparent;
                PasswordBox.ToolTip = "";

                MessageBox.Show("Авторизация прошла успешно!");

                Organization organization = new Organization();
                organization.Show();

            }

            
        }

        private void Button_Window_Main_Click(object sender, RoutedEventArgs e)
        {
            MainWindow mainWindow = new MainWindow();
            mainWindow.Show();
            Hide();
        }

        
    }
}
