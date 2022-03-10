module libnbounds.exceptions;

// Copyright 2022 kaigonzalez
// 
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// 
//     http://www.apache.org/licenses/LICENSE-2.0
// 
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import std.stdio;

/* when there's no final match - Unbalanced */
class __nbounds_lowlevel_unmatched : Exception {
    public:
    this(string msg, string file = __FILE__, size_t line = __LINE__, Throwable nextInChain = null) pure nothrow @nogc @safe
    {
    super(msg, file, line, nextInChain);
    }
}

/* When no instance of the tokens were found - Lexcial analysis wasn't useful */
class __nbounds_noavailableinstance : Exception
{
    this(string msg, string file = __FILE__, size_t line = __LINE__, Throwable nextInChain = null) pure nothrow @nogc @safe
    {
        super(msg, file, line, nextInChain);
    }
}
