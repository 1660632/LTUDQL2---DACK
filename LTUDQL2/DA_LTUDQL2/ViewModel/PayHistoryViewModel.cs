using DA_LTUDQL2.Model;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DA_LTUDQL2.ViewModel
{
    public class PayHistoryViewModel:BaseViewModel
    {
        private ObservableCollection<Model.PayHistory> _List;
        private ObservableCollection<Model.Object> _object;
        private ObservableCollection<Model.Userr> _userr;

        private Model.PayHistory _SelectedItem;// nhấn để hiện ra trên textbox
        private int _Id;
        private Model.Userr _SelectedUser;
        private Nullable<int> _Total;
        private string _Status;

        public ObservableCollection<PayHistory> List
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

        public PayHistory SelectedItem
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
                    Id = SelectedItem.Id;
                    SelectedUser = SelectedItem.Userr;
                    Total = SelectedItem.Total;
                    Status = SelectedItem.Status;
                }
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

     

        public Userr SelectedUser
        {
            get
            {
                return _SelectedUser;
            }

            set
            {
                _SelectedUser = value;
            }
        }

        public int? Total
        {
            get
            {
                return _Total;
            }

            set
            {
                _Total = value;
                OnPropertyChanged();
            }
        }

        public string Status
        {
            get
            {
                return _Status;
            }

            set
            {
                _Status = value;
                OnPropertyChanged();
            }
        }

    
        public ObservableCollection<Userr> Userr
        {
            get
            {
                return _userr;
            }

            set
            {
                _userr = value;
                OnPropertyChanged();
            }
        }

        public PayHistoryViewModel()
        {
            List = new ObservableCollection<Model.PayHistory>(DataProvider.Ins.DB.PayHistories);// hiển thị danh sách
            Userr = new ObservableCollection<Model.Userr>(DataProvider.Ins.DB.Userrs);
        }
    }
}
