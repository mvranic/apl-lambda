﻿using System;

namespace AplAwsRuntime {
    public abstract class AplHandlerBase {
        public Action GetAction(string functionName) {
            Type type = this.GetType();
            var methodInfo = type.GetMethod(functionName);
            return (Action)methodInfo.CreateDelegate(typeof(Action), this);
        }

        public Action<string> GetActionWithArgument(string functionName) {
            Type type = this.GetType();
            var methodInfo = type.GetMethod(functionName);
            return (Action<string>)methodInfo.CreateDelegate(typeof(Action<string>), this);
        }

        public Func<string, string> GetFunc(string functionName) {
            var methodInfo = this.GetType().GetMethod(functionName);
            return (Func<string, string>)methodInfo.CreateDelegate(typeof(Func<string, string>), this);
        }
    }
}
