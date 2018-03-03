using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Vendingmachine
{
    class Program
    {
        static void GiveChange(ref int cents, ref Dictionary<int, int> coins)
        {
            List<int> coinTypes = new List<int>(coins.Keys);

            foreach (int type in coinTypes)
            {
                Console.WriteLine($"here are {coins[type].ToString()} {type} cent coins");
                cents -= coins[type] * type;
            }

            Console.WriteLine($"here are {cents / 25} quarters");
            cents = cents % 25;
            Console.WriteLine($"here are {cents / 10} dimes");
            cents = cents % 10;
            Console.WriteLine($"here are {cents / 5} nickels");
            cents = cents % 5;
            Console.WriteLine($"here are {cents / 5} pennies");

        }
        static void SubractChange(ref int cents, int centsToRemove, ref Dictionary<int, int> coins)
        {
            List<int> coinTypes = new List<int>(coins.Keys);
            coinTypes.Sort();

            for (int i = coinTypes.Count - 1; i >= 0; i--)
            {
                int type = coinTypes[i];
                if (type > centsToRemove)
                {
                    continue;
                }

                while (type > centsToRemove && coins[type] > 0)
                {
                    coins[type]--;
                    centsToRemove -= coins[type];
                }

                cents -= centsToRemove;
            }
        }

        static void Main(string[] args)
        {
            Dictionary<int, int> coins = new Dictionary<int, int>();
            int cents = 0;
            int value = int.MaxValue;

            Random rnd = new Random();

            //I really like while true loops
            while (true) //while machine not under attack/dead
            {
                Console.WriteLine("BTW: write 0 to move on, -1 to get change");
                while (true) //while value != 0
                {
                    Console.WriteLine("insert bills");

                    value = int.Parse(Console.ReadLine());

                    if (value == 0) break;
                    else if (value == -1)
                    {
                        GiveChange(ref cents, ref coins);
                        continue;
                    }

                    cents += value * 100;

                    Console.WriteLine($"total:{cents / 100}.{cents % 100}");
                }

                while (true) //while value != 0
                {
                    Console.WriteLine("insert value of coin");
                    Console.WriteLine("25 = quarter");
                    Console.WriteLine("10 = dime");
                    Console.WriteLine("5 = nickel");
                    Console.WriteLine("1 = penny");

                    value = int.Parse(Console.ReadLine());

                    if (value == 0) break;
                    else if (value == -1)
                    {
                        GiveChange(ref cents, ref coins);
                        continue;
                    }

                    if (coins.ContainsKey(value))
                    {
                        coins[value]++;
                    }
                    else
                    {
                        coins.Add(value, 1);
                    }

                    cents += value;
                    Console.WriteLine($"total:{cents / 100}.{cents % 100}");
                }

                while(true) //while value != 0
                {
                    Console.WriteLine("what is the cost of the thing you wanna buy in cents");

                    value = int.Parse(Console.ReadLine());

                    if (value == 0) break;
                    else if (value == -1)
                    {
                        GiveChange(ref cents, ref coins);
                        continue;
                    }

                    if (value < cents)
                    {
                        Console.WriteLine("not enough money");
                        continue;
                    }
                    
                    if(rnd.Next(0,2) == 0)
                    {
                        Console.WriteLine("haha it got stuck sucks for you");
                    }
                    else
                    {
                        Console.WriteLine("thanks for the $$$");
                    }
                    SubractChange(ref cents, value,ref coins);
                    break;
                }
            }
        }
    }
}
