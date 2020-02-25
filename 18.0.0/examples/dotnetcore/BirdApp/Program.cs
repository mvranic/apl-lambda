using System;
using FlyingEngine;

namespace BirdApp
{
    class Program
    {
        static void Main(string[] args)
        {
            var flyingmanager = new FlyingManager();
            flyingmanager.TakeOff();
            Console.WriteLine("Hello World!");
        }
    }
}
