//
//  DatePicker.swift
//  exzeo.analytics
//
//  Created by Gaurav Singh on 16/02/17.
//  Copyright © 2017 Gaurav Singh. All rights reserved.
//

import UIKit
import Foundation

class DatePicker: UIView {
    
    
    @IBOutlet weak var yearView: GSTCircularView!
    @IBOutlet weak var weekView: GSTCircularView!
    @IBOutlet weak var monthView: GSTCircularView!
    @IBOutlet weak var buttonView: GSTCircularView!

    //Week
    @IBOutlet weak var week1View: GSTLabel!
    @IBOutlet weak var week2View: GSTLabel!
    @IBOutlet weak var week3View: GSTLabel!
    @IBOutlet weak var week4View: GSTLabel!


    
    //Years
    @IBOutlet weak var year1View: GSTLabel!
    @IBOutlet weak var year2View: GSTLabel!
    @IBOutlet weak var year3View: GSTLabel!
    @IBOutlet weak var year4View: GSTLabel!
    @IBOutlet weak var year5View: GSTLabel!
    @IBOutlet weak var year6View: GSTLabel!
    @IBOutlet weak var year7View: GSTLabel!
    @IBOutlet weak var year8View: GSTLabel!

    
    
    //Months
    @IBOutlet weak var janView: GSTLabel!
    @IBOutlet weak var febView: GSTLabel!
    @IBOutlet weak var marView: GSTLabel!
    @IBOutlet weak var aprView: GSTLabel!
    @IBOutlet weak var mayView: GSTLabel!
    @IBOutlet weak var juneView: GSTLabel!
    @IBOutlet weak var julyView: GSTLabel!
    @IBOutlet weak var augView: GSTLabel!
    @IBOutlet weak var sepView: GSTLabel!
    @IBOutlet weak var octView: GSTLabel!
    @IBOutlet weak var novView: GSTLabel!
    @IBOutlet weak var decView: GSTLabel!
    
    
    @IBOutlet weak var selectedDateLabel: UILabel!

    
    @IBOutlet weak var selfWidth: NSLayoutConstraint!
    @IBOutlet weak var yearWidth: NSLayoutConstraint!
    @IBOutlet weak var weekWidth: NSLayoutConstraint!
    @IBOutlet weak var monthWidth: NSLayoutConstraint!
    @IBOutlet weak var buttonWidth: NSLayoutConstraint!

    
    var selectedWeek: UILabel?
    var selectedYear: UILabel?
    var selectedMonth: UILabel?
    
    var onceWeek = true
    var onceYear = true
    var onceMonth = true

    
    
    let color1 = UIColor.white.withAlphaComponent(0.9)//defalut bg color
    let color2 = UIColor(red:0.25, green:0.29, blue:0.72, alpha:1.0)// selected bg color
    let color3 = UIColor(red:0.04, green:0.15, blue:0.26, alpha:1.0)//font color
    let color4 = UIColor.white//selected font color
    
    
    override init(frame: CGRect) {
    
        super.init(frame: frame)
        self.basicSetup()

    }

    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        self.basicSetup()
        
    }
    
    
    
    func basicSetup() {

        DispatchQueue.main.asyncAfter(wallDeadline: (.now() + 0.1)) {

            self.selfWidth.constant = self.buttonWidth.constant
          
            self.monthView.alpha = 0
            self.yearView.alpha = 0
            self.weekView.alpha = 0
            
            
            let date = Date()
            let calendar = Calendar.current
            
            var year = Int(calendar.component(.year, from: date))

            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM"
            
            self.year1View.text = "\(year)"
            year -= 1
            self.year2View.text = "\(year)"
            year -= 1
            self.year3View.text = "\(year)"
            year -= 1
            self.year4View.text = "\(year)"
            year -= 1
            self.year5View.text = "\(year)"
            year -= 1
            self.year6View.text = "\(year)"
            year -= 1
            self.year7View.text = "\(year)"
            year -= 1
            self.year8View.text = "\(year)"

            
            self.selectedDateLabel.text = "\(year) \(dateFormatter.string(from: date))"
            
            
        }
        
    }
    
    func initUI() {

        //bg color
        self.week1View.backgroundColor = self.color1
        self.week2View.backgroundColor = self.color1
        self.week3View.backgroundColor = self.color1
        self.week4View.backgroundColor = self.color1
        
        self.year1View.backgroundColor = self.color1
        self.year2View.backgroundColor = self.color1
        self.year3View.backgroundColor = self.color1
        self.year4View.backgroundColor = self.color1
        self.year5View.backgroundColor = self.color1
        self.year6View.backgroundColor = self.color1
        self.year7View.backgroundColor = self.color1
        self.year8View.backgroundColor = self.color1
        
        self.janView.backgroundColor = self.color1
        self.febView.backgroundColor = self.color1
        self.marView.backgroundColor = self.color1
        self.aprView.backgroundColor = self.color1
        self.mayView.backgroundColor = self.color1
        self.juneView.backgroundColor = self.color1
        self.julyView.backgroundColor = self.color1
        self.augView.backgroundColor = self.color1
        self.sepView.backgroundColor = self.color1
        self.octView.backgroundColor = self.color1
        self.novView.backgroundColor = self.color1
        self.decView.backgroundColor = self.color1
        
        
        //font color
        self.week1View.textColor = self.color3
        self.week2View.textColor = self.color3
        self.week3View.textColor = self.color3
        self.week4View.textColor = self.color3
        
        self.year1View.textColor = self.color3
        self.year2View.textColor = self.color3
        self.year3View.textColor = self.color3
        self.year4View.textColor = self.color3
        self.year5View.textColor = self.color3
        self.year6View.textColor = self.color3
        self.year7View.textColor = self.color3
        self.year8View.textColor = self.color3
        
        self.janView.textColor = self.color3
        self.febView.textColor = self.color3
        self.marView.textColor = self.color3
        self.aprView.textColor = self.color3
        self.mayView.textColor = self.color3
        self.juneView.textColor = self.color3
        self.julyView.textColor = self.color3
        self.augView.textColor = self.color3
        self.sepView.textColor = self.color3
        self.octView.textColor = self.color3
        self.novView.textColor = self.color3
        self.decView.textColor = self.color3
        
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if (touches.first != nil) {

            self.initUI()

            self.selfWidth.constant = self.weekWidth.constant
            self.layoutIfNeeded()

            self.selectedYear = nil
            self.selectedMonth = nil
        
            onceWeek = true
            onceYear = true
            onceMonth = true
            
            self.showYearView()

            
        }
        
        
    }
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        
        if let touch = touches.first {
            
            var point = touch.location(in: self)

            
            if self.buttonView.frame.contains(point) {
                
                self.showButtonViewOnly()
                
            } else if self.monthView.frame.contains(point) && !self.yearView.frame.contains(point) {
                
                self.showWeekView()
                
            } else if self.yearView.frame.contains(point) && !self.buttonView.frame.contains(point) {
                
                self.showMonthView()
                
            } else {
                
                
            }
            
            
            
            
            
            
            let lastSelectedWeek = self.selectedWeek
            let lastSelectedYear = self.selectedYear
            let lastSelectedMonth = self.selectedMonth
            
            
            point = touch.location(in: self.weekView)
            
            //Week
            if self.week1View.frame.contains(point) {
                self.selectedWeek = self.week1View
            }
            if self.week2View.frame.contains(point) {
                self.selectedWeek = self.week2View
            }
            if self.week3View.frame.contains(point) {
                self.selectedWeek = self.week3View
            }
            if self.week4View.frame.contains(point) {
                self.selectedWeek = self.week4View
            }

            
            
            point = touch.location(in: self.yearView)
            
            //Years
            if self.year1View.frame.contains(point) {
                self.selectedYear = self.year1View
            }
            if self.year2View.frame.contains(point) {
                self.selectedYear = self.year2View
            }
            if self.year3View.frame.contains(point) {
                self.selectedYear = self.year3View
            }
            if self.year4View.frame.contains(point) {
                self.selectedYear = self.year4View
            }
            if self.year5View.frame.contains(point) {
                self.selectedYear = self.year5View
            }
            if self.year6View.frame.contains(point) {
                self.selectedYear = self.year6View
            }
            if self.year7View.frame.contains(point) {
                self.selectedYear = self.year7View
            }
            if self.year8View.frame.contains(point) {
                self.selectedYear = self.year8View
            }
            
            point = touch.location(in: self.monthView)
            
            //Months
            if self.janView.frame.contains(point) {
                self.selectedMonth = self.janView
            }
            if self.febView.frame.contains(point) {
                self.selectedMonth = self.febView
            }
            if self.marView.frame.contains(point) {
                self.selectedMonth = self.marView
            }
            if self.aprView.frame.contains(point) {
                self.selectedMonth = self.aprView
            }
            if self.mayView.frame.contains(point) {
                self.selectedMonth = self.mayView
            }
            if self.juneView.frame.contains(point) {
                self.selectedMonth = self.juneView
            }
            if self.julyView.frame.contains(point) {
                self.selectedMonth = self.julyView
            }
            if self.augView.frame.contains(point) {
                self.selectedMonth = self.augView
            }
            if self.sepView.frame.contains(point) {
                self.selectedMonth = self.sepView
            }
            if self.octView.frame.contains(point) {
                self.selectedMonth = self.octView
            }
            if self.novView.frame.contains(point) {
                self.selectedMonth = self.novView
            }
            if self.decView.frame.contains(point) {
                self.selectedMonth = self.decView
            }
            
            
            if lastSelectedYear != self.selectedYear {

                lastSelectedYear?.backgroundColor = self.color1
                lastSelectedYear?.textColor = self.color3
                
                self.selectedYear?.backgroundColor = self.color2
                self.selectedYear?.textColor = self.color4

                self.selectedWeek?.backgroundColor = self.color1
                self.selectedMonth?.backgroundColor = self.color1
                
                self.selectedWeek = nil
                self.selectedMonth = nil

            }
            
            if lastSelectedMonth != self.selectedMonth {
                
                lastSelectedMonth?.backgroundColor = self.color1
                lastSelectedMonth?.textColor = self.color3
                
                self.selectedMonth?.backgroundColor = self.color2
                self.selectedMonth?.textColor = self.color4
                
                self.selectedWeek?.backgroundColor = self.color1
                self.selectedWeek = nil

            }
            
            if lastSelectedWeek != self.selectedWeek {
                
                lastSelectedWeek?.backgroundColor = self.color1
                lastSelectedWeek?.textColor = self.color3
                
                self.selectedWeek?.backgroundColor = self.color2
                self.selectedWeek?.textColor = self.color4
                
            }
            
            

        }
        
        
    }
    
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {

        
        self.rolloutAnimation()
        
        if (self.selectedYear != nil) || (self.selectedMonth != nil) || (self.selectedWeek != nil) {

            self.selectedWeek?.backgroundColor = self.color1
            self.selectedYear?.backgroundColor = self.color1
            self.selectedMonth?.backgroundColor = self.color1
            
            self.selectedWeek?.textColor = self.color3
            self.selectedYear?.textColor = self.color3
            self.selectedMonth?.textColor = self.color3
            
            
            var text = ""

            if (self.selectedYear != nil) {
                text = text + " " + self.selectedYear!.text!
            }
            
            if (self.selectedMonth != nil) {
                text = text + " " + self.selectedMonth!.text!
            }

            if (self.selectedWeek != nil) {
                text = text + " " + self.selectedWeek!.text!
            }

            self.selectedDateLabel.text = text
            
        
            self.selectedWeek = nil
            self.selectedYear = nil
            self.selectedMonth = nil
         
            
//            let tr = self.buttonView.transform
//            
//            UIView.animate(withDuration: 0.25, animations: {
//                
//                self.buttonView.transform = tr.scaledBy(x: 1.5, y: 1.5);
//                
//            }) { (_) in
//                
//                UIView.animate(withDuration: 0.25, animations: {
//                    self.buttonView.transform = tr
//                })
//                
//            }
            
        }

    }
    
    func rolloutAnimation() {
        
        
        self.isUserInteractionEnabled = false
        
        let ti = 0.025
        
        UIView.animate(withDuration: ti, animations: {
            
            self.week1View.alpha = 0
            
        }) { (_) in
            
            UIView.animate(withDuration: ti, animations: {
                
                self.week2View.alpha = 0
                
            }) { (_) in
                
                UIView.animate(withDuration: ti, animations: {
                    
                    self.week3View.alpha = 0
                    
                }) { (_) in
                    
                    UIView.animate(withDuration: ti, animations: {
                        
                        self.week4View.alpha = 0
                        
                    })
                    
                }
                
            }
            
        }
        
                
                
        UIView.animate(withDuration: ti, animations: {
            
            self.janView.alpha = 0
            
        }) { _ in
            
            UIView.animate(withDuration: ti, animations: {
                self.febView.alpha = 0
                
            }) { _ in
                
                UIView.animate(withDuration: ti, animations: {
                    self.marView.alpha = 0
                    
                }) { _ in
                    
                    UIView.animate(withDuration: ti, animations: {
                        self.aprView.alpha = 0
                        
                    }) { _ in
                        
                        UIView.animate(withDuration: ti, animations: {
                            self.mayView.alpha = 0
                            
                        }) { _ in
                            
                            UIView.animate(withDuration: ti, animations: {
                                self.juneView.alpha = 0
                                
                            }) { _ in
                                
                                UIView.animate(withDuration: ti, animations: {
                                    self.julyView.alpha = 0
                                    
                                }) { _ in
                                    
                                    UIView.animate(withDuration: ti, animations: {
                                        self.augView.alpha = 0
                                        
                                    }) { _ in
                                        
                                        UIView.animate(withDuration: ti, animations: {
                                            self.sepView.alpha = 0
                                            
                                        }) { _ in
                                            
                                            UIView.animate(withDuration: ti, animations: {
                                                self.octView.alpha = 0
                                                
                                            }) { _ in
                                                
                                                UIView.animate(withDuration: ti, animations: {
                                                    self.novView.alpha = 0
                                                    
                                                }) { _ in
                                                    
                                                    UIView.animate(withDuration: ti, animations: {
                                                        self.decView.alpha = 0
                                                        
                                                    })
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        

        
        UIView.animate(withDuration: ti, animations: {
            
            self.year1View.alpha = 0
            
        }, completion: { _ in
            
            UIView.animate(withDuration: ti, animations: {
                
                self.year2View.alpha = 0
                
            }, completion: { _ in
                
                UIView.animate(withDuration: ti, animations: {
                    
                    self.year3View.alpha = 0
                    
                }, completion: { _ in
                    
                    
                    UIView.animate(withDuration: ti, animations: {
                        
                        self.year4View.alpha = 0
                        
                    }, completion: { _ in
                        
                        UIView.animate(withDuration: ti, animations: {
                            
                            self.year5View.alpha = 0
                            
                        }, completion: { _ in
                            
                            UIView.animate(withDuration: ti, animations: {
                                
                                self.year6View.alpha = 0
                                
                            }, completion: { _ in
                                
                                UIView.animate(withDuration: ti, animations: {
                                    
                                    self.year7View.alpha = 0
                                    
                                }, completion: { _ in
                                    
                                    UIView.animate(withDuration: ti, animations: {
                                        
                                        self.year8View.alpha = 0
                                        
                                    }, completion: { _ in
                                        
                                        
                                        
                                        //conclusion
                                        
                                        UIView.animate(withDuration: 0.25, animations: {
                                            
                                            self.monthView.alpha = 0
                                            self.yearView.alpha = 0
                                            self.weekView.alpha = 0
                                            
                                        }) { (_) in
                                            
                                            self.selfWidth.constant = self.buttonWidth.constant
                                            self.isUserInteractionEnabled = true
                                            self.layoutIfNeeded()
                                            
                                        }
                                        
                                        
                                    })
                                })
                            })
                        })
                    })
                })
            })
        })
        
    
    }
    
    
    func showButtonViewOnly() {
        
        UIView.animate(withDuration: 0.5, animations: {

            self.monthView.alpha = 0
            self.yearView.alpha = 1
            self.weekView.alpha = 0
            
        })
        
        self.selectedMonth?.backgroundColor = self.color1
        self.selectedWeek?.backgroundColor = self.color1
        self.selectedYear?.backgroundColor = self.color1
        
        self.selectedMonth?.textColor = self.color4
        self.selectedWeek?.textColor = self.color4
        self.selectedYear?.textColor = self.color4
        
        self.selectedWeek = nil
        self.selectedYear = nil
        self.selectedMonth = nil

    }
    
    func showWeekView() {

        
        if self.weekView.alpha == 1 {
            return
        }
        
        if onceWeek {
            // forward
        } else {
            
            UIView.animate(withDuration: 0.5, animations: {
                self.monthView.alpha = 1
                self.yearView.alpha = 1
                self.weekView.alpha = 1
            })
            return
        }
        
        onceWeek = false
        
        self.week1View.alpha = 0
        self.week2View.alpha = 0
        self.week3View.alpha = 0
        self.week4View.alpha = 0
        
        self.monthView.alpha = 1
        self.yearView.alpha = 1
        self.weekView.alpha = 1

        let ti = 0.05

        UIView.animate(withDuration: ti, animations: {
            
            self.week1View.alpha = 1

        }) { (_) in
            
            UIView.animate(withDuration: ti, animations: {
                
                self.week2View.alpha = 1
                
            }) { (_) in
                
                UIView.animate(withDuration: ti, animations: {
                    
                    self.week3View.alpha = 1
                    
                }) { (_) in
                    
                    UIView.animate(withDuration: ti, animations: {
                        
                        self.week4View.alpha = 1
                        
                    }) { (_) in
                        
                        
                    }
                    
                }
                
            }
            
        }
        
        
    }
    
    func showMonthView() {
    
       
        if self.monthView.alpha == 1 &&  self.weekView.alpha == 0 {
            return
        }

        
        
        if onceMonth {
            // forward
        } else {
            
            UIView.animate(withDuration: 0.5, animations: {
                self.monthView.alpha = 1
                self.yearView.alpha = 1
                self.weekView.alpha = 0
            })
            return
        }
        
        onceMonth = false

        let ti = 0.05

        self.janView.alpha = 0
        self.febView.alpha = 0
        self.marView.alpha = 0
        self.aprView.alpha = 0
        self.mayView.alpha = 0
        self.juneView.alpha = 0
        self.julyView.alpha = 0
        self.augView.alpha = 0
        self.sepView.alpha = 0
        self.octView.alpha = 0
        self.novView.alpha = 0
        self.decView.alpha = 0
        
        self.monthView.alpha = 1
        self.yearView.alpha = 1
        self.weekView.alpha = 0

        
        UIView.animate(withDuration: ti, animations: {
            self.janView.alpha = 1

        }) { _ in
            
            UIView.animate(withDuration: ti, animations: {
                self.febView.alpha = 1
      
            }) { _ in
                
                UIView.animate(withDuration: ti, animations: {
                    self.marView.alpha = 1

                }) { _ in
                    
                    UIView.animate(withDuration: ti, animations: {
                        self.aprView.alpha = 1

                    }) { _ in
                        
                        UIView.animate(withDuration: ti, animations: {
                            self.mayView.alpha = 1

                        }) { _ in
                            
                            UIView.animate(withDuration: ti, animations: {
                                self.juneView.alpha = 1

                            }) { _ in
                                
                                UIView.animate(withDuration: ti, animations: {
                                    self.julyView.alpha = 1

                                }) { _ in
                                    
                                    UIView.animate(withDuration: ti, animations: {
                                        self.augView.alpha = 1

                                    }) { _ in
                                        
                                        UIView.animate(withDuration: ti, animations: {
                                            self.sepView.alpha = 1

                                        }) { _ in
                                            
                                            UIView.animate(withDuration: ti, animations: {
                                                self.octView.alpha = 1

                                            }) { _ in
                                                
                                                UIView.animate(withDuration: ti, animations: {
                                                    self.novView.alpha = 1

                                                }) { _ in
                                                    
                                                    UIView.animate(withDuration: ti, animations: {
                                                        self.decView.alpha = 1

                                                    }) { _ in
                                                        
                                                        
                                                        
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        
    
    }
    
    
    func showYearView() {
        
        self.selectedMonth?.backgroundColor = self.color1
        self.selectedMonth?.textColor = self.color4
        
        self.selectedWeek?.backgroundColor = self.color1
        self.selectedWeek?.textColor = self.color4

        self.selectedMonth = nil
        self.selectedWeek = nil
        
        if self.yearView.alpha == 1 {
            return
        }

        self.monthView.alpha = 0
        self.yearView.alpha = 1
        self.weekView.alpha = 0

        if !onceYear {
            return
        }
        
        onceYear = false
        
        self.year1View.alpha = 0
        self.year2View.alpha = 0
        self.year3View.alpha = 0
        self.year4View.alpha = 0
        self.year5View.alpha = 0
        self.year6View.alpha = 0
        self.year7View.alpha = 0
        self.year8View.alpha = 0
        

        let ti = 0.05

        
        UIView.animate(withDuration: ti, animations: {
            
            self.year1View.alpha = 1
            
        }, completion: { _ in
            
            UIView.animate(withDuration: ti, animations: {
                
                self.year2View.alpha = 1
                
            }, completion: { _ in
                
                UIView.animate(withDuration: ti, animations: {
                    
                    self.year3View.alpha = 1
                    
                }, completion: { _ in
                    
                    
                    UIView.animate(withDuration: ti, animations: {
                        
                        self.year4View.alpha = 1
                        
                    }, completion: { _ in
                        
                        UIView.animate(withDuration: ti, animations: {
                            
                            self.year5View.alpha = 1
                            
                        }, completion: { _ in
                            
                            UIView.animate(withDuration: ti, animations: {
                                
                                self.year6View.alpha = 1
                                
                            }, completion: { _ in
                                
                                UIView.animate(withDuration: ti, animations: {
                                    
                                    self.year7View.alpha = 1
                                    
                                }, completion: { _ in
                                    
                                    UIView.animate(withDuration: ti, animations: {
                                        
                                        self.year8View.alpha = 1
                                        
                                    }, completion: { _ in
                                        
                                        
                                        
                                    })
                                })
                            })
                        })
                    })
                })
            })
        })
    }
    
    
}
