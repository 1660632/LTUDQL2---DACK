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
    public class UserViewModel:BaseViewModel
    {
        private ObservableCollection<Model.Userr> _List;
        private ObservableCollection<Model.UserRole> _Role;
        private Model.Userr _SelectedItem;// nhấn để hiện ra trên textbox
        private string _DisplayName;
        private string _Email;
        private string _Password;
        private Model.UserRole _SelectedRole;
        private int _Id;



        public ICommand AddCommand { get; set; }
        public ICommand EditCommand { get; set; }
        public ICommand DeleteCommand { get; set; }

        public ObservableCollection<Userr> List
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

        public Userr SelectedItem
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
                    Email = SelectedItem.Email;
                    Password = SelectedItem.Password;
                    SelectedRole = SelectedItem.UserRole;
                }
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

        public string Email
        {
            get
            {
                return _Email;
            }

            set
            {
                _Email = value;
                OnPropertyChanged();
            }
        }

        public string Password
        {
            get
            {
                return _Password;
            }

            set
            {
                _Password = value;
                OnPropertyChanged();
            }
        }

        public UserRole SelectedRole
        {
            get
            {
                return _SelectedRole;
            }

            set
            {
                _SelectedRole = value;
                OnPropertyChanged();
            }
        }

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

        public ObservableCollection<UserRole> Role
        {
            get
            {
                return _Role;
            }

            set
            {
                _Role = value;
                OnPropertyChanged();
            }
        }

        public UserViewModel()
        {
            List = new ObservableCollection<Model.Userr>(DataProvider.Ins.DB.Userrs);// hiển thị danh sách
            Role = new ObservableCollection<Model.UserRole>(DataProvider.Ins.DB.UserRoles);

            AddCommand = new RelayCommand<object>((p) =>
            {

                if (SelectedRole == null)
                {
                    return false;
                }
                return true;
            }, (p) =>
            {
                var Userr = new Model.Userr() { DisplayName = DisplayName, Email=Email, Password=Password, IdRole=SelectedRole.Id};
                DataProvider.Ins.DB.Userrs.Add(Userr);
                DataProvider.Ins.DB.SaveChanges();

                List.Add(Userr);

            });

            EditCommand = new RelayCommand<object>((p) =>
            {
                if (SelectedRole == null || SelectedItem==null)
                {
                    return false;
                }
                return true;
            }, (p) =>
            {
                var user = DataProvider.Ins.DB.Userrs.Where(x => x.Id == SelectedItem.Id).SingleOrDefault();//lấy ra id tương ứng
                user.IdRole = SelectedRole.Id;               
                DataProvider.Ins.DB.SaveChanges();

                SelectedItem.IdRole = SelectedRole.Id;

                var userList = List.Where(x => x.Id == SelectedItem.Id).SingleOrDefault();
                userList.IdRole = SelectedRole.Id;



            });
        }
    }
}
