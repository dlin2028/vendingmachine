using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace Vendingmachine
{    
    public class CoinValueAttribute : Attribute
    {
        public int Value { get; set; }

        public CoinValueAttribute(int value)
        {
            Value = value;
        }
    }

    class ExampleVendingMachine
    {
        public enum CoinTypes
        {
            [CoinValue(25)]
            Quarter = 1,

            [CoinValue(10)]
            Dime,

            [CoinValue(5)]
            Nickel,

            [CoinValue(1)]
            Penny
        }

        private int GetCoinValue(CoinTypes coin)
        {
            Type coinType = typeof(CoinTypes);
            FieldInfo coinInType = coinType.GetField(coin.ToString());
            var coinValueAttribute = coinInType.GetCustomAttribute<CoinValueAttribute>(false);
            //hi
            return coinValueAttribute.Value;
        }

        private SortedDictionary<CoinTypes, int> CoinInventory = new SortedDictionary<CoinTypes, int>()
        {
            { CoinTypes.Dime, 100 },
            { CoinTypes.Quarter, 100 },
            { CoinTypes.Nickel, 0 },
            { CoinTypes.Penny, 2 }
        };

        public void GetCoinsFromCustmer()
        {
            foreach (var item in CoinInventory)
            {
                Console.WriteLine($"{(int)item.Key}: {item.Key.ToString()}");
            }

            //TODO: Get user input
            int userInput = 3;

            if (userInput < 1 || userInput > 4)
            {
                //TODO: Handle Invalid entry...
            }

            CoinTypes coinIn = (CoinTypes)userInput;
            int value = GetCoinValue(coinIn);
        }
    }





    class Program
    {
        struct Item
        {
            public Item(int price, int stock)
            {
                this.price = price;
                this.stock = stock;
            }
            public int price;
            public int stock;
        }
        static void GiveChange(ref int cents)
        {
            Console.WriteLine($"here are {cents / 25} quarters");
            cents = cents % 25;
            Console.WriteLine($"here are {cents / 10} dimes");
            cents = cents % 10;
            Console.WriteLine($"here are {cents / 5} nickels");
            cents = cents % 5;
            Console.WriteLine($"here are {cents} pennies");
            cents = 0;
        }
        static void Main(string[] args)
        {
            var example = new ExampleVendingMachine();
            example.GetCoinsFromCustmer();




            int cents = 0;
            List<int> acceptedBills = new List<int>();
            Dictionary<string, int> coins = new Dictionary<string, int>();
            Dictionary<string, int> coinValues = new Dictionary<string, int>();

            #region money
            acceptedBills.Add(1);
            acceptedBills.Add(2);
            acceptedBills.Add(5);
            acceptedBills.Add(10);
            acceptedBills.Add(20);
            acceptedBills.Add(50);
            acceptedBills.Add(100);

            coinValues.Add("quarter", 25);
            coinValues.Add("nickle", 5);
            coinValues.Add("dime", 10);
            coinValues.Add("penny", 1);

            coins.Add("quarter", 0);
            coins.Add("nickle", 0);
            coins.Add("dime", 0);
            coins.Add("penny", 0);
            #endregion

            List<string> types = new List<string>(coins.Keys);

            Dictionary<string, Item> items = new Dictionary<string, Item>();

            items.Add("issac", new Item(674, 5));
            items.Add("alex", new Item(100, 5));
            items.Add("stan", new Item(1, 5));
            items.Add("thad", new Item(312, 5));

            List<string> itemNames = new List<string>(items.Keys);

            Random rng = new Random();

            Console.WriteLine("Type 0 to move on, type -1 to give change");

            int input = 0;
            while (true)
            {
                Console.WriteLine("Insert bills");

                while (true)
                {
                    input = int.Parse(Console.ReadLine());
                    if (input == 0)
                    {
                        break;
                    }
                    else if (input == -1)
                    {
                        GiveChange(ref cents);
                        Console.WriteLine("Insert bills");
                        continue;
                    }
                    else if (!acceptedBills.Contains(input))
                    {
                        Console.WriteLine($"thanks for the fake bill");
                        continue;
                    }
                    Console.WriteLine($"Inserted ${input} bill");
                    cents += input * 100;
                    Console.WriteLine("Total: $" + string.Format("{0:#.00}", Convert.ToDecimal(cents.ToString()) / 100));
                }


                Console.WriteLine("Insert coins");
                for (int i = 0; i < coins.Keys.Count; i++)
                {
                    Console.WriteLine($"{i + 1} for {coins.Keys.ElementAt(i)}");
                }

                while (true)
                {
                    var help = Console.ReadKey().KeyChar.ToString();
                    input = int.Parse(help);
                    if (input == 0)
                    {
                        break;
                    }
                    else if (input == -1)
                    {
                        GiveChange(ref cents);
                        break;
                    }
                    input--;
                    Console.WriteLine($"Inserted {types[input]}");
                    cents += coinValues[types[input]];
                    Console.WriteLine("Total: $" + string.Format("{0:#.00}", Convert.ToDecimal(cents.ToString()) / 100));
                }


                Console.WriteLine("Items:");
                List<string> ItemNames = new List<string>(items.Keys);
                for (int i = 0; i < itemNames.Count; i++)
                {
                    Console.WriteLine($"Press {i} for {itemNames[i]}  in stock: {items[itemNames[i]].stock}, price: {items[itemNames[i]].price}");
                }
                while (true)
                {
                    input = int.Parse(Console.ReadKey().ToString());
                    if (input == 0)
                    {
                        break;
                    }
                    else if (input == -1)
                    {
                        GiveChange(ref cents);
                        break;
                    }

                    if (items[itemNames[input]].stock <= 0)
                    {
                        Console.WriteLine("out of stock haha thanks for the $$$");
                    }
                    else if (rng.Next(0, 5) == 0)
                    {
                        Console.WriteLine($"haha your {itemNames[input]} got stuck ");
                    }
                    else
                    {
                        Console.WriteLine($"enjoy your {itemNames[input]}");
                    }

                    input--;
                    cents -= items[itemNames[input]].price;
                    Console.WriteLine("Total: $" + string.Format("{0:#.00}", Convert.ToDecimal(cents.ToString()) / 100));
                }

            }

        }
    }
}
