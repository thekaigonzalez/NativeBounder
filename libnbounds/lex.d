module libnbounds.lex;

import libnbounds.type;
import std.stdio;
import libnbounds.exceptions;
import std.conv;

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

/* LOAD AND LEX */
string __nbounds_gettext(string __input, char __boundin, char __boundout) {
    Buffer out_feed = "";

    NB_State s = -1;
    

    for (int i = 0 ; i < __input.length ; ++ i) {
        

        if (__input[i] == __boundin && s == -1) 
        {
            s = 0;
            s += 10;
        } 

        else if (__input[i] == __boundout && s == 0) 
        {
            break;
        } 

        else if (__input[i] == __boundout && s != 0) 
        {

            if (s-10 == 0) {s-=10;break;}
            s -= 10;
            out_feed ~= __input[i];
        } 

        else if (__input[i] == __boundin && s != 0) 
        {
            out_feed ~= __input[i];
            s += 10;    
        } 

        else 
        {
            
            out_feed ~= __input[i];
        }
    }

    // POST-CHECK

    if (s == -1) 
    {
        throw new __nbounds_noavailableinstance("no match was started.");
    } 

    else if (s < 0 || s > 0) 
    throw new __nbounds_lowlevel_unmatched("state was not 0, check the string again.");
    
    else 
    {
        string put = cast(string)out_feed;
        return put;
    }
}