import Foundation

// Look at every subsequent pair (R to L) for each number

let monotonicallyIncreasing: [Int] = (356261 ... 846303).compactMap { num in
    var tmp = num
    var increasing = true
    while tmp > 0 {
        let lastDigit = tmp % 10
        tmp /= 10
        let prevDigit = tmp % 10

        guard prevDigit <= lastDigit else {
            increasing = false
            break
        }
    }
    return increasing ? num : nil
}

let results1 = monotonicallyIncreasing.filter { candidate in
    let digits = Array(String(candidate))
    return zip(digits, digits[1...])
        .filter { $0.0 == $0.1 }
        .count > 0
}

print(results1.count)


let results2 = monotonicallyIncreasing.filter { candidate in
    let digits = Array(String(candidate))
    
    return digits
        .reduce(into: [:]) { counts, digit in counts[digit, default: 0] += 1}
        .values
        .contains(2)
}.count

