pragma solidity ^0.4.11;

contract BorrowChain {
  //here goes code for lending stuff

  struct ItemForBorrowing {
    uint   id;
    string name;
    uint   deposit;
    string location;
    uint   rate;
    //bool     newItem;
  }
  ItemForBorrowing[] items;

  struct Borrowing {
    address borrowerId;
    string timeOfBorrowing;
    uint charge;
    //bool   exists;
  }
  Borrowing[] borrowings;

  mapping( uint =>  Borrowing ) borrowedItems;

  //function getInitialItems(uint count) returns (ItemForBorrowing[]) {
  //  ItemForBorrowing[] localItems;
  //  for(uint id=1; id <= count; id++) {
  //    ItemForBorrowing item = ItemForBorrowing(id,"Bike",100,"Vancouver",5);
  //    localItems.push(item);
  //  }
  //  return localItems;
  //}

  /////ignore for now
  function BorrowChain() {
    //here set all items in the shop
    //items = getInitialItems(5);
    ItemForBorrowing memory item;
    item.id = 1; item.name = "Bike"; item.deposit = 100; 
    item.location =  "Vancouver"; 
    item.rate = 5;

    items.push(item);
  }

  function addItem(uint id, string name, uint deposit, string location, uint rate) {
    //todo item id has to calucated here since item has to be unique
    //id = calculateItemId();
    //ItemForBorrowing item = ItemForBorrowing({id: id, name: name, deposit: deposit, location: location, rate: rate});
    
    ItemForBorrowing memory item;
    item.id = id; item.name = name; item.deposit = deposit; 
    item.location =  location; 
    item.rate = rate;

    items.push(item); 
  }

  //todo
  function calculateItemId() returns (uint) {
    return 0;
  }

  function getChargeOfBorrower(address borrowerId) returns (uint) {
    uint totalCharge = 0;
    for(uint i= 0; i< borrowings.length; i++) {
      Borrowing b  = borrowings[i];
      if(b.borrowerId == borrowerId) {
        totalCharge += b.charge;
      }
    }
    return totalCharge;
  }

  function statusOfItem(uint itemId) returns (string) {
     string borrowedAt = borrowedItems[itemId].timeOfBorrowing;
     return borrowedAt;
  }

  function transferItem(uint itemId, string timeOfCall) {
    returnItem(itemId,timeOfCall);
    borrowItem(itemId,timeOfCall);
  }

  //this function only visible or accessible from the owner of the item
  function returnItem(uint itemId, string timeOfCall) {
    //check if itemId already in mapping
   //if(borrowedItems[itemId] != 0) {
      //find out hte current borrower and then charge them
      //using a new variable
      Borrowing currentBorrowing = borrowedItems[itemId];
      //string timeDuration      = timeOfCall - currentBorrower.timeOfCall
      currentBorrowing.charge = 5; //update charge
   //}
  }

  //assuming msg.sender is borrower
  function borrowItem(uint itemId, string timeOfCall) {
    //Borrowing b            = Borrowing({borrowerId: msg.sender, timeOfBorrowing: timeOfCall, charge: 0}); //set charge to 0

    Borrowing memory b;
    b.borrowerId = msg.sender; b.timeOfBorrowing = timeOfCall; b.charge = 0;

    borrowings.push(b);
    //set next borrower
    borrowedItems[itemId] = b;
  }

}
