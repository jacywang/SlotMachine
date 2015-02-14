//
//  SlotBrain.swift
//  SlotMachine
//
//  Created by JIAN WANG on 2/13/15.
//  Copyright (c) 2015 JACY WANG. All rights reserved.
//

import Foundation

class SlotBrain {
    class func unpackSlotsIntoSlotsRows(slots: [[Slot]]) -> [[Slot]] {
        var slotRow1: [Slot] = []
        var slotRow2: [Slot] = []
        var slotRow3: [Slot] = []
        
        for slotArray in slots {
            slotRow1.append(slotArray[0])
            slotRow2.append(slotArray[1])
            slotRow3.append(slotArray[2])
        }
        
        var slotsInRows: [[Slot]] = [slotRow1, slotRow2, slotRow3]
        
        return slotsInRows
    }
    
    class func computeWinnings(slots: [[Slot]]) -> Int {
        var slotsInRows = unpackSlotsIntoSlotsRows(slots)
        var winnings = 0
        
        var flushWinCount = 0
        var threeOfAKindWinCount = 0
        var straightWinCount = 0
        
        for slotRow in slotsInRows {
            if checkFlush(slotRow) == true {
                println("flush")
                flushWinCount += 1
                winnings += 1
            }
            
            if checkThreeInARow(slotRow) == true {
                println("three in a row")
                straightWinCount = 1
                winnings += 1
            }
            
            if checkThreeAInARow(slotRow) == true {
                println("Three of a kind")
                threeOfAKindWinCount += 1
                winnings += 1
            }
        }
        
        if flushWinCount == 3 {
            println("Royal flush")
            winnings += 15
        }
        
        if straightWinCount == 3 {
            println("Epic straight")
            winnings += 1000
        }
        
        if threeOfAKindWinCount == 3 {
            println("Threes all around")
            winnings += 50
        }
        
        return winnings
    }
    
    class func checkFlush(slotRow: [Slot]) -> Bool {
        let slot1 = slotRow[0]
        let slot2 = slotRow[1]
        let slot3 = slotRow[2]
        
        if slot1.isRed == true && slot2.isRed == true && slot3.isRed == true {
            return true
        } else if slot1.isRed == false && slot2.isRed == false && slot3.isRed == false {
            return true
        } else {
            return false
        }
    }
    
    class func checkThreeInARow(slotRow: [Slot]) -> Bool {
        let slot1 = slotRow[0]
        let slot2 = slotRow[1]
        let slot3 = slotRow[2]
        
        if slot1.value == slot2.value - 1 && slot1.value == slot3.value - 2 {
            return true
        } else if slot1.value == slot2.value + 1 && slot1.value == slot3.value + 2 {
            return true
        } else {
            return false
        }
    }
    
    class func checkThreeAInARow(slotRow: [Slot]) -> Bool {
        let slot1 = slotRow[0]
        let slot2 = slotRow[1]
        let slot3 = slotRow[2]
        
        if slot1.value == slot2.value && slot1.value == slot2.value {
            return true
        } else {
            return false
        }
    }
}