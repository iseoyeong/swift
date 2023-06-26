//
//  ViewController.swift
//  PickerView
//
//  Created by Dongduk3 on 2023/06/26.
//

import UIKit

class ViewController: UIViewController,
                      UIPickerViewDelegate, UIPickerViewDataSource {
    let MAX_ARRAY_NUM = 10
//    let PICKER_VIEW_COLUMN = 1
    let PICKER_VIEW_COLUMN = 2
    var imageFileName = [ "1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg", "6.jpg", "7.jpg", "8.jpg", "9.jpg", "10.jpg" ]
    var imageArray = [UIImage?]()
    let PICKER_VIEW_HEIGHT:CGFloat = 80
    
    @IBOutlet var lblImageFileName: UILabel!
    @IBOutlet var pickerImage: UIPickerView!
    
    @IBOutlet var lblImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //이미지 파일 이름을 배열에 append
        for i in 0 ..< MAX_ARRAY_NUM {
            let image = UIImage(named: imageFileName[i])
            imageArray.append(image)
        }
        
        lblImageFileName.text = imageFileName[0]
        lblImageView.image = imageArray[0]
    }

    //    delegate method
//        컬럼 개수 리턴
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
        
    //    배열 개수 리턴
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageFileName.count
    }

//        실제 항목 파일의 이름 -> 글자 표시 역할이므로 주석
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return imageFileName[row]
//    }
    
//    pickerView에 파일명이 아니라 image가 나오도록 함
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image:imageArray[row])  //액자 생성해서 이미지 파일 지정
        imageView.frame = CGRect(x:0, y: 0, width: 100, height:150)//프레임 크기 지정
        
        return imageView
    }
    
    //pickerView 행높이 지정
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return PICKER_VIEW_HEIGHT
    }

//    스크롤 했을 때 위치를 레이블에 표시 -> 그림 파일을 로딩하는 작업 추가
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        lblImageFileName.text = imageFileName[row]
//        lblImageView.image = imageArray[row]    //image 바꿀 수 있도록
        
        //왼쪽 컴포넌트와 오른쪽 컴포넌트를 선택했을 때 다른 동작을 하도록 수정
        if (component==0){
            lblImageFileName.text = imageFileName[row]
        }
        else {
            lblImageView.image = imageArray[row]    //image 바꿀 수 있도록
        }
    }
    
}

