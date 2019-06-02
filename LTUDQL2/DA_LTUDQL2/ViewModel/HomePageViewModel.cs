using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;

namespace DA_LTUDQL2.ViewModel
{
    public class HomePageViewModel : BaseViewModel
    {
        public bool IsLoaded = false;
        public ICommand LoginCommand { get; set; }
        public HomePageViewModel()
        {


            LoginCommand = new RelayCommand<Window>((p) => { return true; }, (p) =>
            {
                
                IsLoaded = true;

                LoginWindow loginWindow = new LoginWindow();
                
                loginWindow.ShowDialog();
               
            });


        }
    }   
}
