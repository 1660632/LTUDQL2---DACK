//using System;
//using System.Collections.Generic;
//using System.Collections.ObjectModel;
//using System.Linq;
//using System.Text;
//using System.Threading.Tasks;
//using System.Windows;
//using System.Windows.Input;

//namespace DA_LTUDQL2.ViewModels
//{
//    public class MainViewModel : BaseViewModel
//    {
//        public bool IsLoaded = false;
//        public ICommand LoadedWindowCommand { get; set; }
//        public ICommand InputCommand { get; set; }
//        public ICommand UnitCommand { get; set; }

//        public ICommand SuplierCommand { get; set; }
//        public ICommand ObjectCommand { get; set; }
//        public ICommand UserNameCommand { get; set; }

//        public MainViewModel()
//        {        
           
//            ObjectCommand = new RelayCommand<object>((p) => { return true; }, (p) => { MainWindow wd = new MainWindow(); wd.ShowDialog(); });
            
//        }
//    }
//}
