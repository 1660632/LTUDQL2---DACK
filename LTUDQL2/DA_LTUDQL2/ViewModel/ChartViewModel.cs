using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DA_LTUDQL2.Model;
using System.Collections.ObjectModel;

namespace DA_LTUDQL2.ViewModel
{
    public class ChartViewModel:BaseViewModel
    {
        private Model.FavorList _SelectItem;
        private Model.FavorList _SelectedKindVdeo;

        private int _Count1;
        private int _Count2;
        private int _Count3;
        private int _Count4;
        private int _Count5;
        private int _Count6;
        private int _Count7;
        private int _Count8;
        private int _Count9;
        private int _Count10;
        private int _Count11;

        public int Count1
        {
            get
            {
                return _Count1;
            }

            set
            {
                _Count1 = value;
                OnPropertyChanged();
            }
        }

        public int Count2
        {
            get
            {
                return _Count2;
            }

            set
            {
                _Count2 = value;
                OnPropertyChanged();
            }
        }

        public int Count3
        {
            get
            {
                return _Count3;
            }

            set
            {
                _Count3 = value;
                OnPropertyChanged();
            }
        }

        public int Count4
        {
            get
            {
                return _Count4;
            }

            set
            {
                _Count4 = value;
                OnPropertyChanged();
            }
        }

        public int Count5
        {
            get
            {
                return _Count5;
            }

            set
            {
                _Count5 = value;
                OnPropertyChanged();
            }
        }

        public int Count6
        {
            get
            {
                return _Count6;
            }

            set
            {
                _Count6 = value;
                OnPropertyChanged();
            }
        }

        public int Count7
        {
            get
            {
                return _Count7;
            }

            set
            {
                _Count7 = value;
                OnPropertyChanged();
            }
        }

        public int Count8
        {
            get
            {
                return _Count8;
            }

            set
            {
                _Count8 = value;
                OnPropertyChanged();
            }
        }

        public int Count9
        {
            get
            {
                return _Count9;
            }

            set
            {
                _Count9 = value;
                OnPropertyChanged();
            }
        }

        public int Count10
        {
            get
            {
                return _Count10;
            }

            set
            {
                _Count10 = value;
                OnPropertyChanged();
            }
        }

        public int Count11
        {
            get
            {
                return _Count11;
            }

            set
            {
                _Count11 = value;
                OnPropertyChanged();
            }
        }

        public FavorList SelectItem
        {
            get
            {
                return _SelectItem;
            }

            set
            {
                _SelectItem = value;
                OnPropertyChanged();
            }
        }

        public FavorList SelectedKindVdeo
        {
            get
            {
                return _SelectedKindVdeo;
            }

            set
            {
                _SelectedKindVdeo = value;
                OnPropertyChanged();
            }
        }

        public int IdKind
        {
            get
            {
                return _IdKind;
            }

            set
            {
                _IdKind = value;
                OnPropertyChanged();
            }
        }

        public ObservableCollection<FavorList> List
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

        private int _IdKind;
        private ObservableCollection<FavorList> _List;

        public ChartViewModel()
        {
            List = new ObservableCollection<FavorList>();


            var query = from FavorList in DataProvider.Ins.DB.FavorLists.AsEnumerable()
                        where FavorList.IdKind == 1
                        select FavorList.IdKind;

            Count1 = query.Count();
        }   
    }
}
