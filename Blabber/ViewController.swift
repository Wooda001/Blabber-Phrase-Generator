//
//  ViewController.swift
//  Blabber
//
//  Created by Andy Woodard on 9/3/16.
//  Copyright © 2016 WoodardStudios. All rights reserved.
//

import UIKit
import GameplayKit
import QuartzCore

class ViewController: UIViewController {
    
    
    
    var count = 0
    
    var score = 0
    
    var catalog = [String]()
    
    var timer = NSTimer()

    @IBOutlet weak var phraseLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    //TIME FUNCS & VARS 
    
    
    
    @IBOutlet weak var timerLabel: UILabel!
    
    var time = 00
    
    
    
    
    
    internal func countDown(){
        if time > 0{
        time -= 1
            updateTimer()}
        else {
            timer.invalidate()
            nextLabel.hidden = true
            skipLabel.hidden = true
            startLabel.hidden = false
           
            
            phraseLabel.text = "TIMES UP!"
            phraseLabel.textColor = UIColor.redColor()
            
        }
    }
    
    internal func updateTimer(){
        
        timerLabel.text = String(time)
        
        
    }
    
    @IBAction func startTime(){
        nextLabel.hidden = false
        skipLabel.hidden = false
        startLabel.hidden = true
        score = 0
        scoreLabel.text = "Points: \(String(score))"
        time = 60
        updateTimer()
        nextPhrase()
        phraseLabel.textColor = UIColor.blackColor()
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(ViewController.countDown), userInfo: nil, repeats: true)
        
        
    }
    
    
    // END TIMER FUNCS
    
    
    
    //BUTTON PROPERTIES
    
    
    @IBOutlet weak var startLabel: UIButton!
    
    @IBOutlet weak var nextLabel: UIButton!
    
    @IBOutlet weak var skipLabel: UIButton!
    
    internal func setToDefault(){
        phraseLabel.text = "PRESS START TO BEGIN"
        score = 0
        scoreLabel.text = "Points: \(String(score))"
    }
    
    internal func nextPhrase(){
        if count < catalog.count{
            phraseLabel.text = catalog[count]
            count += 1}
        else{
            phraseLabel.text = "NO PHRASES LEFT"
        }    }
    
    

    @IBAction func skipButton(sender: AnyObject) {
            
        nextPhrase()
    
    }
    
    @IBAction func nextButton(sender: AnyObject) {
        if count > 0{
            if phraseLabel.text != "No more phrases Available"{
            score += 1
                scoreLabel.text = "Points: \(String(score))"}
        }
        nextPhrase()
        
    }
    
    
    @IBOutlet weak var background: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        phraseLabel.text = "PRESS START TO BEGIN"
        
        catalog.append("Big Babies Wearing Purple Diapers")
        catalog.append("Eating Ribs with No Mayonaise")
        catalog.append("The Royal Family's Pizza Party")
        catalog.append("My Skin is Smooth as Peaches")
        catalog.append("Harambe Was an Inside Job")
        catalog.append("Banana Pancakes at the Picnic")
        catalog.append("The Car Crash was Vibrating")
        catalog.append("String Cheese Fell of the Bus")
        catalog.append("Greedy Elephants Pooped Asperagus")
        catalog.append("The Tiny Dancer Baked Muffins")
        catalog.append("Racecars Under Inspection")
        catalog.append("Babies Don't Do Cross Words")
        catalog.append("Smelly Feet Are in the Tree")
        catalog.append("Hungry Monkeys Don't Like Potatoes")
        catalog.append("Shopping Carts in the Airplane")
        catalog.append("Biting Biscuits and Washing Machines")
        catalog.append("Dinosaurs Sleep with No Socks")
        catalog.append("Bouncy Donkeys Steal Cars")
        catalog.append("Girl Scout Bake Sale")
        catalog.append("Farting and Walking Away")
        catalog.append("Oprah Eating Lean Cuisine")
        catalog.append("Ellen Degenres Has Daddy Issues")
        catalog.append("Mister Rogers Passing a Kidney Stone")
        catalog.append("Black Pepper on Salted Watermelon")
        catalog.append("A Gassy Antelope in the Field")
        catalog.append("Eating Kebabs with No Ketchup")
        catalog.append("New Age Music Smells Like Soccer")
        catalog.append("Stranger Danger is in the Mall")
        catalog.append("Britney Spears at Age 55")
        catalog.append("Eating Tacos Gives Me Diarreah")
        catalog.append("Children on Leashes at the Exhibit")
        catalog.append("Smelling Socks are Gross")
        catalog.append("Super Soaker Full of Cat Urine")
        catalog.append("Tickling Elmo is Not Funny")
        catalog.append("Oompa Loompas Love the Lollipops")
        catalog.append("Biting Grapes While Unicycling")
        catalog.append("Dancing with Midget Wrestlers")
        catalog.append("Bickering About the Big Dipper")
        catalog.append("Tickle My Pink Ear")
        catalog.append("Cross-dressers Licking Toads")
        catalog.append("All Kids Love Watching Dolphins")
        catalog.append("Lions Tigers and Pears on Pie")
        catalog.append("Most Things are Different in Russia")
        catalog.append("Don't Touch My Brown Bear")
        catalog.append("Abraham Lincoln at the Theater")
        catalog.append("Santa Clause Licks Carpets")
        catalog.append("My Duck is Stuck in the Oven")
        catalog.append("Mommy and Purple Raisin")
        catalog.append("Uncles Repairing Rocking Chairs")
        catalog.append("Purple Fungus on a Daisy")
        catalog.append("Elephants Smashing Pumpkins")
        catalog.append("Football is a Boring Sport")
        catalog.append("Volleyball Makes me Hungry")
        catalog.append("The Olympics Destroy Small Children")
        catalog.append("The Bicycle Was Too Tired")
        catalog.append("The Foxes Hide in the Suitcase")
        catalog.append("Bookshelves Full of Snowglobes")
        catalog.append("West Side Beauty Pageant")
        catalog.append("Dancing with Barracudas")
        catalog.append("An Angry Foxtrot Competition")
        catalog.append("Placing Leaves in the Fireplace")
        catalog.append("Building a Faulty Ceiling")
        catalog.append("Glacier Cherry GatorAid")
        catalog.append("Going too Fast on a Boat")
        catalog.append("Preparing Pesto Pasta")
        catalog.append("What time is My Vaccine?")
        catalog.append("Doctor Bug Bite")
        catalog.append("Lemon Pepper Fish")
        catalog.append("Preparing Cheese Broccoli")
        catalog.append("Sounding the School Bell")
        catalog.append("Blaring Loud Rap Music")
        catalog.append("Bear in Big Blue House")
        catalog.append("The Fleas Sneeze on the Bees Knees")
       
        

        
        
        
        catalog = GKRandomSource.sharedRandom().arrayByShufflingObjectsInArray(catalog) as! [String]
  
        
        background.image = UIImage.init(named: "36")
        
        
        phraseLabel.layer.backgroundColor  = UIColor.whiteColor().CGColor
        phraseLabel.layer.cornerRadius = 15
        phraseLabel.clipsToBounds = true
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

