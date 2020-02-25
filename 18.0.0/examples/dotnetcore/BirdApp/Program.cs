using System;
using GreatFlyingEngine;

namespace BirdApp
{
    class Program
    {
        static void Main(string[] args)
        {
            var flyingmanager = new GreatFlyingManager();
            flyingmanager.TakeOff();
            Console.WriteLine("Hello World!");
        }
    }
}
