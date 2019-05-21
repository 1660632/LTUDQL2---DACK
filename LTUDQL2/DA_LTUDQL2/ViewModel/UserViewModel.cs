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
        private ObservableCollection<User> _List;
        private User _SelectedItem;
        private int _Id;
        private string _DisplayName;
        private string _UserName;
        private string _Password;
        private string _Phone;
        private string _Address;
        private string _Email;
        private Model.UserRole _SelectedRole;


        public ObservableCollection<User> List
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

        public string Phone
        {
            get
            {
                return _Phone;
            }

            set
            {
                _Phone = value;
                OnPropertyChanged();
            }
        }

        public string Address
        {
            get
            {
                return _Address;
            }

            set
            {
                _Address = value;
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

        public string UserName
        {
            get
            {
                return _UserName;
            }

            set
            {
                _UserName = value;
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

        public User SelectedItem
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
                    UserName = SelectedItem.UserName;
                    Password = SelectedItem.Password;
                    Address = SelectedItem.Address;
                    Phone = SelectedItem.Phone;
                    Email = SelectedItem.Email;

                    SelectedRole = SelectedItem.UserRole;
                }
            }
        }

        public ICommand AddCommand { get; set; }
        public ICommand EditCommand { get; set; }
        public ICommand DeleteCommand { get; set; }

       

       
       

        public UserViewModel()
        {
            List = new ObservableCollection<User>(DataProvider.Ins.DB.Users);// hiển thị danh sách

            AddCommand = new RelayCommand<object>((p) =>
            {              
                return true;
            }, (p) =>
            {
                var user = new User() { DisplayName = DisplayName, UserName=UserName, Password=Password, Phone = Phone, Address = Address, Email = Email, IdRole=SelectedRole.Id };
                DataProvider.Ins.DB.Users.Add(user);
                DataProvider.Ins.DB.SaveChanges();

                List.Add(user);
            });

            EditCommand = new RelayCommand<object>((p) =>
            {             
                return true;
            }, (p) =>
            {
                var user = DataProvider.Ins.DB.Users.Where(x => x.Id == SelectedItem.Id).SingleOrDefault();//lấy ra id tương ứng
                user.DisplayName = DisplayName;
                user.UserName = UserName;
                user.Password = Password;
                user.Address = Address;
                user.Email = Email;
                user.Phone = Phone;
                user.IdRole = SelectedRole.Id;

                DataProvider.Ins.DB.SaveChanges();

                user.DisplayName = DisplayName;
            });


        }
    }
}
