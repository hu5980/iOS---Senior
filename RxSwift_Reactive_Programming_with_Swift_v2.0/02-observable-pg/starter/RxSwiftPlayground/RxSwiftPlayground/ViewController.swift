//
//  ViewController.swift
//  RxSwiftPlayground
//
//  Created by Scott Gardner on 10/15/17.
//  Copyright © 2017 Scott Gardner. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
class ViewController: UIViewController {

  let disposeBag = DisposeBag()
    
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
    super.viewDidLoad()
    //这个block有一个回调参数observer就是订阅这个Observable对象的订阅者
    //当一个订阅者订阅这个Observable对象的时候，就会将订阅者作为参数传入这个block来执行一些内容
//    let observable = Observable<String>.create{observer in
//                //对订阅者发出了.next事件，且携带了一个数据"hangge.com"
//                observer.onNext("hangge.com")
//                //对订阅者发出了.completed事件
//                observer.onCompleted()
//                //因为一个订阅行为会有一个Disposable类型的返回值，所以在结尾一定要returen一个Disposable
//                return Disposables.create()
//    }
//
//    //订阅测试
//    observable.subscribe {
//        print($0)
//    }.dispose()
    
//    let observable = Observable<Int>.interval(1, scheduler: MainScheduler.instance)
//    observable.subscribe { event in
//        print(event)
//    }
    
//    let observable = Observable.of("A", "B", "C")
//
//    observable.subscribe { event in
//        print(event)
//    }
    
//    let observable = Observable.from(["A","B","C"])
//
//    let observable1 = Observable.of("A","B","C","D")
//
//    observable.subscribe(onNext: { element in
//        print(element)
//    }, onError: { error in
//        print(error)
//    }, onCompleted: {
//        print("completed")
//    }, onDisposed: {
//        print("disposed")
//    }).dispose()
//
//    observable1.subscribe { event in
//        print(event.element)
//    }.dispose()
   
//    let observable = Observable.of("A", "B", "C")
//
//    observable.do(onNext: { element in
//            print("Intercepted Next：", element)
//        }, onError: { error in
//            print("Intercepted Error：", error)
//        }, onCompleted: {
//            print("Intercepted Completed")
//        }, onDispose: {
//            print("Intercepted Disposed")
//        }).subscribe(onNext: { element in
//            print(element)
//        }, onError: { error in
//            print(error)
//        }, onCompleted: {
//            print("completed")
//        }, onDisposed: {
//            print("disposed")
//        }).dispose()
    
    
//    let observable = Observable<Int>.interval(1, scheduler: MainScheduler.instance)
//        observable.map {"当前索引数：\($0 )"}.bind { [unowned self](text) in
//                self.label.text = text
//        }.disposed(by: disposeBag)
    
//        let observer:AnyObserver<String> = AnyObserver { (event) in
//            switch event {
//            case .next(let data):
//                print(data)
//            case .error(let data):
//                print(data)
//            case .completed:
//                print("completed")
//            }
//        }
//
//        let observable = Observable.of("A","B","C","D")
//        observable.subscribe(observer).dispose()
    
//        let observer:AnyObserver<String> = AnyObserver  {[unowned self] (event) in
//            switch event {
//            case .next(let text):
//                self.label.text = text
//            default:
//                break
//            }
//        }
        
//        let observer:Binder<String> = Binder(label) { (view, text) in
//            //收到发出的索引数后显示到label上
//            view.text = text
//        }

//        let observable = Observable<Int>.interval(0.5, scheduler: MainScheduler.instance)
//        observable.map {"当前索引数：\($0 )"}.bind(to: observer).disposed(by: disposeBag)
        

//        let observable = Observable<Int>.interval(1, scheduler: MainScheduler.instance)
//        observable
//            .map { "当前索引数：\($0 )"}
//            .bind(to: label.rx.text) //收到发出的索引数后显示到label上
//            .disposed(by: disposeBag)
////        observable
//            .map { CGFloat($0) }
//            .bind(to: label.fontSize) //根据索引数不断变放大字体
//            .disposed(by: disposeBag)
        
//        observable
//            .map { CGFloat($0) }
//            .bind(to: label.rx.fontSize) //根据索引数不断变放大字体
//            .disposed(by: disposeBag)
    
    // Do any additional setup after loading the view, typically from a nib.
        
//
//        let subject = PublishSubject<String>()
//        subject.onNext("111")
//
//        subject.subscribe(onNext: { (string) in
//             print("第一次订阅:",string)
//        }, onCompleted: {
//            print("第一次订阅:","Completed")
//        }).disposed(by: disposeBag)
//
//        subject.onNext("222")
//
//        subject.subscribe(onNext: { (string) in
//            print("第二次订阅:",string)
//        }, onCompleted: {
//            print("第二次订阅:","Completed")
//        }).disposed(by: disposeBag)
//
//        subject.onNext("333")
//
//        subject.onCompleted()
//
//        //subject完成后会发出.next事件了。
//        subject.onNext("444")
//
//        //subject完成后它的所有订阅（包括结束后的订阅），都能收到subject的.completed事件，
//        subject.subscribe(onNext: { string in
//            print("第3次订阅：", string)
//        }, onCompleted:{
//            print("第3次订阅：Completed")
//        }).disposed(by: disposeBag)
        
//        let disposeBag = DisposeBag()
//
//        //创建一个BehaviorSubject
//        let subject = BehaviorSubject(value: "111")
//
//        //第1次订阅subject
//        subject.subscribe { event in
//            print("第1次订阅：", event)
//            }.disposed(by: disposeBag)
//
//        //发送next事件
//        subject.onNext("222")
//
//        //发送error事件
//        subject.onError(NSError(domain: "local", code: 0, userInfo: nil))
//
//        //第2次订阅subject
//        subject.subscribe { event in
//            print("第2次订阅：", event)
//            }.disposed(by: disposeBag)
        
//        let disposeBag = DisposeBag()
//
//        //创建一个bufferSize为2的ReplaySubject
//        let subject = ReplaySubject<String>.create(bufferSize: 2)
//
//        //连续发送3个next事件
//        subject.onNext("111")
//        subject.onNext("222")
//        subject.onNext("333")
//
//        //第1次订阅subject
//        subject.subscribe { event in
//            print("第1次订阅：", event)
//            }.disposed(by: disposeBag)
//
//        //再发送1个next事件
//        subject.onNext("444")
//
//        //第2次订阅subject
//        subject.subscribe { event in
//            print("第2次订阅：", event)
//            }.disposed(by: disposeBag)
//
//        //让subject结束
//        subject.onCompleted()
//
//        //第3次订阅subject
//        subject.subscribe { event in
//            print("第3次订阅：", event)
//            }.disposed(by: disposeBag)
        
        
        let disposeBag = DisposeBag()
        
        //创建一个初始值为111的Variable
        let variable = Variable("111")
        
        //修改value值
        variable.value = "222"
        
        //第1次订阅
        variable.asObservable().subscribe {
            print("第1次订阅：", $0)
            }.disposed(by: disposeBag)
        
        //修改value值
        variable.value = "333"
        
        //第2次订阅
        variable.asObservable().subscribe {
            print("第2次订阅：", $0)
            }.disposed(by: disposeBag)
        
        //修改value值
        variable.value = "444"
        
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}


//extension UILabel {
//    public var fontSize: Binder<CGFloat> {
//        return Binder(self) { label, fontSize in
//            label.font = UIFont.systemFont(ofSize: fontSize)
//        }
//    }
//}


extension Reactive where Base: UILabel {
    public var fontSize: Binder<CGFloat> {
        return Binder(self.base) { label, fontSize in
            label.font = UIFont.systemFont(ofSize: fontSize)
        }
    }
}

