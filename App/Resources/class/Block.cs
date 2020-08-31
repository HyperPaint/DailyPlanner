using Android.App;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace App
{
    public abstract class Block
    {
        //Картинки
        public enum Icon : int
        {
            noicon,
            i1, i2, i3, i4, i5, i6, i7, i8, i9, i10, i11, i12, i13, i14, i15, i16, i17, i18, i19, i20, i21, i22, i23, i24, i25, i26, i27, i28, i29, i30
        }

        public static int[] Icons =
        {
            Resource.Drawable.nopicture,
            Resource.Drawable.BlockIcon1,
            Resource.Drawable.BlockIcon2,
            Resource.Drawable.BlockIcon3,
            Resource.Drawable.BlockIcon4,
            Resource.Drawable.BlockIcon5,
            Resource.Drawable.BlockIcon6,
            Resource.Drawable.BlockIcon7,
            Resource.Drawable.BlockIcon8,
            Resource.Drawable.BlockIcon9,
            Resource.Drawable.BlockIcon10,
            Resource.Drawable.BlockIcon11,
            Resource.Drawable.BlockIcon12,
            Resource.Drawable.BlockIcon13,
            Resource.Drawable.BlockIcon14,
            Resource.Drawable.BlockIcon15,
            Resource.Drawable.BlockIcon16,
            Resource.Drawable.BlockIcon17,
            Resource.Drawable.BlockIcon18,
            Resource.Drawable.BlockIcon19,
            Resource.Drawable.BlockIcon20,
            Resource.Drawable.BlockIcon21,
            Resource.Drawable.BlockIcon22,
            Resource.Drawable.BlockIcon23,
            Resource.Drawable.BlockIcon24,
            Resource.Drawable.BlockIcon25,
            Resource.Drawable.BlockIcon26,
            Resource.Drawable.BlockIcon27,
            Resource.Drawable.BlockIcon28,
            Resource.Drawable.BlockIcon29,
            Resource.Drawable.BlockIcon30
        };

        //Рандом
        public Block()
        {
            GetRandom();
        }
        //Копирование
        public Block(Block block)
        {
            this.Name = block.Name;
            this.IconId = block.IconId;
            this.Created = block.Created;
        }
        //Загрузка
        public Block(string Name, Block.Icon IconId, DateTime Created)
        {
            this.Name = Name;
            this.IconId = IconId;
            this.Created = Created;
        }

        ~Block()
        {

        }

        public void Change(Block block)
        {
            this.Name = block.Name;
            this.IconId = block.IconId;
            //this.Created = block.Created;
        }

        public string Name { get; protected set; } //Название
        public Icon IconId { get; protected set; } //Ид картинки
        public DateTime Created { get; protected set; } //Дата создания

        protected abstract void GetRandom();

        //Только для сортировки
        public static bool operator >(Block block1, Block block2)
        {
            //Алфавит
            if (block1.Name.CompareTo(block2.Name) > 0) return true;
            else return false;
        }

        public static bool operator <(Block block1, Block block2)
        {
            return false;
        }

        public static void Sort<T>(ref List<T> list) where T : Block
        {
            ShellSort(4, ref list);
            ShellSort(2, ref list);
            ShellSort(1, ref list);
        }

        private static void ShellSort<T>(int distance, ref List<T> list) where T : Block
        {
            T value;
            int index;
            for (int i = 1; i < list.Count; i++)
            {
                value = list[i];
                index = i;
                while (index >= distance && list[index - distance] > value)
                {
                    list[index] = list[index - distance];
                    index = index - distance;
                }
                list[index] = value;
            }
        }
    }
}