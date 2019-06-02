using DA_LTUDQL2.Model;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace DA_LTUDQL2.ViewModel
{
    public class SupplierViewModel:BaseViewModel
    {
        private ObservableCollection<Suplier> _List;
        private Suplier _SelectedItem;// nhấn để hiện ra trên textbox
        private string _DisplayName;
        private int _Id;

        public ObservableCollection<Suplier> List
        {
            get
            {
                return _List;
            }

            set
            {
                _List = value;
                OnPropertyChanged();
            }
        }
        public string DisplayName
        {
            get
            {
                return _DisplayName;
            }

            set
            {
                _DisplayName = value;
                OnPropertyChanged();
            }
        }
        public Suplier SelectedItem
        {
            get
            {
                return _SelectedItem;
            }

            set
            {
                _SelectedItem = value;
                OnPropertyChanged();
                if (SelectedItem != null)
                {
                    DisplayName = SelectedItem.DisplayName;
                    Id = SelectedItem.Id;
                }
            }
        }

        public ICommand AddCommand { get; set; }
        public ICommand EditCommand { get; set; }
        public ICommand DeleteCommand { get; set; }

        public int Id
        {
            get
            {
                return _Id;
            }

            set
            {
                _Id = value;
                OnPropertyChanged();
            }
        }


        public SupplierViewModel()
        {
            List = new ObservableCollection<Suplier>(DataProvider.Ins.DB.Supliers);// hiển thị danh sách

            AddCommand = new RelayCommand<object>((p) =>
            {
                if (string.IsNullOrEmpty(DisplayName))
                    return false;

                var displayList = DataProvider.Ins.DB.UserRoles.Where(x => x.DisplayName == DisplayName);
                if (displayList == null || displayList.Count() == 0) //điều kiện để nhấn dc button
                    return true;

                return false;



            }, (p) =>
            {
                var role = new Suplier() { DisplayName = DisplayName };
                DataProvider.Ins.DB.Supliers.Add(role);
                DataProvider.Ins.DB.SaveChanges();// cập nhật trên db

                List.Add(role);


            });

            EditCommand = new RelayCommand<object>((p) =>
            {
                if (SelectedItem == null)
                {
                    return false;
                }
                return true;
            }, (p) =>
            {
                var role = DataProvider.Ins.DB.Supliers.Where(x => x.Id == SelectedItem.Id).SingleOrDefault();//lấy ra id tương ứng
                role.DisplayName = DisplayName;
                role.Id = Id;

                DataProvider.Ins.DB.SaveChanges();

                DisplayName = SelectedItem.DisplayName;
                Id = SelectedItem.Id;


            });


            }
            
    }
}
