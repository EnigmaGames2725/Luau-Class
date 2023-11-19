# Set Documentation
The Roblox Documentation defines a set as:
> A set is a collection of items with no order and no duplicate elements. An item either _**is**_ or _**is not**_ contained within a set.

# Summary
## Constructor
A set is created using `Set.new()`. This function accepts a single parameter `Items`, which can either be an array of strings or `nil`.
### Example
```lua
-- Create an empty set:
local MySet = Set.new()

-- Create a set with given components:
local MySet = Set.new("Apple", "Pear")
```

## Methods
Sets can be manipulated with a variety of methods.

### :Add()
The `Set:Add()` method is useful for adding new items to a set after it has already been created. It accepts one parameter `New`, which can be either a string or an array of strings. The string(s) passed through the method will be added to the set.
#### Example
```lua
-- Create a set:
local MySet = Set.new("Apple", "Pear")

-- Add an item to the set:
MySet:Add("Mango")

-- Add multiple items to the set:
MySet:Add({"Raspberry", "Kiwi"})
```

### :Remove()
The `Set:Remove()` method is a method for removing items from a set. It accepts one parameter `New`, which can be either a string or an array of strings. The string(s) passed through the method will be removed from the set.
#### Example
```lua
-- Create a set:
local MySet = Set.new("Apple", "Pear", "Peach")

-- Remove an item from the set:
MySet:Remove("Apple")

-- Remove multiple items from a set:
MySet:Add({"Pear", "Peach"})
```

### :Contains()
The `Set:Contains()` method returns a boolean value of if a set contains the given value(s). It's sole parameter `Value` can be either a string or an array of strings. It only returns true if **all** of the given values are present in the set.
#### Example
```lua
-- Create a set:
local MySet = Set.new("Apple", "Pear")

-- Check if an item is in a set:
MySet:Contains("Apple") -- -> true

-- Check if multiple items are in a set:
MySet:Add({"Apple", "Kiwi"}) -- -> false
```
