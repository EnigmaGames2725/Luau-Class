# Luau-Class Idiom Specification
## Intro
Luau-Class utilizes an OOP idiom similar to the one described in [this post](https://devforum.roblox.com/t/a-new-object-oriented-programming-idiom-and-why-you-should-ditch-the-old-one/2070691/6).
The main difference between the two is that Luau-Class's idiom utilizes three tables (Class, Schema, & Metatable), while the original idiom uses four
(Class, Interface, Schema, & Metatable). This implementation allows 
### Class
The `Class` table is used to hold the class constructor and any functions related to the class that are not classified as class methods.
> **What's the difference?**<br>
> To better explain what I mean by functions that are not class methods, I'll utilize an example from the Roblox Luau native DataType `Color3`.
> A `Color3` class method would be `:ToHex()`, while a related function would be `.fromRGB()`. The functions are tied to the class, but are not
> seen as methods.
### Schema
The `Schema` table holds all of the methods of the class.
### Metatable
The `Metatable` table is used as the metatable of the initialized object. To inherit the methods from `Schema`, it's `__index` should equal
the `Schema` table. Aside from `__index`, any metamethods can be used depending on the needs of the class implementation.
## Example
Below is an example of a basic class implemented with this idiom.
```lua
local Class = {}

local Schema = {}
local Metatable = {__index = Schema}

-- Constructor
function Class.new()
  return setmetatable({}, Metatable)
end

-- Method
function Schema:Method()
  -- do stuff
end

-- Related Function
function Class:Func()
  -- do stuff
end

-- For use in type-checking
export type Class = typeof(Class.new(table.unpack({...})))

return Class
```
## Style Guide
| Type | Style       |
| ----------- | ----------- |
| Constructor | `.new()`    |
| Method      |`:PascalCase()`|
| Related Function |`:PascalCase()`|
| Variable | `.PascalCase` |
