import XCTest

func XCTAssertType(_ expectedType: Any.Type, of symbol: Any, file: StaticString = #file, line: UInt = #line) {
    let type = type(of: symbol)
    if type != expectedType {
        let message = String(describing: expectedType) + " is not equal to " + String(describing: type)
        XCTFail(message, file: file, line: line)
    }
}

//func XCTAssertSuperclass(superclass: AnyObject.Type, of symbol: AnyObject, file: StaticString = #file, line: UInt = #line) {
//    let mirror = Mirror(reflecting: symbol)
//    let supermirror = mirror.superclassMirror
//    if supermirror?.subjectType != superclass {
//        let message = String(describing: superclass) + " is not equal to " + String(describing: supermirror?.subjectType)
//        XCTFail(message, file: file, line: line)
//    }
//}
