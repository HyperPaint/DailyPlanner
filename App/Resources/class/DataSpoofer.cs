using Android.Views;
using System;
using System.Collections.Generic;

namespace App
{
    //Для подмены данных и поиска
    public abstract class DataSpoofer<T> where T : Block
    {
        protected List<T> InData;
        public List<T> OutData { private set; get; }
        public int Count => OutData.Count;
        public T this[int Position] => OutData[Position];

        private string LastSearch = string.Empty;

        public DataSpoofer(ref List<T> In)
        {
            this.InData = In;
            OutData = new List<T>(this.InData.Count);
            Search(string.Empty);
        }

        ~DataSpoofer()
        {

        }

        public void Reload()
        {
            OutData.Clear();
            Search(LastSearch);
        }

        protected abstract bool SearchProcess(string Text, int Index);

        public void Search(String Text)
        {
            LastSearch = Text;
            OutData.Clear();
            if (Text == string.Empty)
            {
                OutData.AddRange(InData.ToArray());
            }
            else
            {
                for (int i = 0; i < InData.Count; i++)
                {
                    if (SearchProcess(Text, i))
                    {
                        OutData.Add(InData[i]);
                    }
                }
            }
        }
    }
}