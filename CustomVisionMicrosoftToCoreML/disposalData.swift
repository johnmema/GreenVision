struct Name {
    var instructions: [String:String] = [
        "bandaid" : "Medical waste can pose a safety hazard and never goes in curbside recycling or waste bins. Dispose of them in a safe container, or contact your local provider.",
        "battery" : "Batteries are hazerdous waste! Look for in-store recycling bins or community collection events to dispose of batteries.",
        "bread" : "The greenest way of disposing of food waste such as bread, composting is the answer. You can turn the food scraps into the garden every couple of days.",
        "bulb" : "Fluorescent Lamps and Tubes are toxic pollutant if broken! Take lamps and tubes to a household hazardous waste collection center or event.",
        "cans" : "Make sure all cans are clear of liquids or foods that could be left in the container. You can do this by rinsing the can when you're finished with it. Also, ask your local recycling center to see if you need to remove the paper labels from the can or if it's part of their process.",
        "carton" : "Cardboard pizza delivery boxes without leftovers or liners should be recycled; but leftover crusts, cheese and other food should not.",
        "chopsticks" : "Wooden chopsticks can be disposed of with other green waste. Plastic chopsticks are usually made out of plastic #5 and can be recycled.",
        "diapers" : "These materials will spoil all of the recyclables, turning the load to trash. Trash these instead and keep recyclables clean and dry.",
        "dishes" : "If you can, wrap up the pieces in a cloth and break them down further with a hammer so they won't hurt anyone. Then, dispose of them as broken glass.",
        "facialmask" : "The best way to ensure that disposable masks do not end up on the streets or ocean is to ensure they actually end up in the trash bins and eventually in landfills.",
        "glassbottle" : "Check local program guidelines for options to recycle glass. Some communities have curbside pickup or drop-off locations to recycle glass.",
        "leftovers" : "Add the food waste to cardboard, newspaper, vegetation and other organic materials in your compost pile. Mix it in with soil and dirt so the food can be broken down.",
        "medicinebottle" : "Recycle plastics by shape: bottles, jars, jugs and tubs. Clean and dry containers, then put the cap back on before tossing in the bin.",
        "milkbox"  : "Rules for recycling milk cartons, juice boxes and food cartons vary by city, county and state. Check local recycling programs for options to recycle cartons. Make sure containers are completely empty to avoid contamination.",
        "napkin" : "Dispose used paper napkins with other food waste. This is because the fibers in a napkin are too short to be made into new paper. Also, they are usually soiled which affects contaminates the recycling process.",
        "newspaper" : "Paper, newspaper and magazines are good to recycle. If paper is soiled or wet, compost it.",
        "nuts" : "Dispose nut shells with other food waste.",
        "pen" : "The easiest way to recycle pens is to send them to TerraCycle's Writing Instrument Brigade. The program is sponsored by pen manufacturers Sharpie and Paper Mate, so you can return all their products through the program. That includes pens and pen caps, highlighters, markers and mechanical pencils.",
        "plasticbag" : "Do not bag recyclables as materials inside may not get recycled. Reuse plastic bags, or learn where you can recycle them at plasticfilmrecycling.org.",
        "plasticbottle" : "Recycle plastics by shape: bottles, jars, jugs and tubs. Clean and dry containers, then put the cap back on before tossing in the bin."
    ]

    func getInstruction(product: String) -> String {
        return instructions[product] ?? "bandaid"
    }
    
}
