//
//  ClukConfigurations.swift
//
//
//  Created by Pierre Janineh on 17/11/2023.
//

import Foundation

public class ClukConfigurations {
    private(set) var builder: ClukConfigurationsBuilder = ClukConfigurationsBuilder()
    
    init() {}
    
    func setTimeText(_ isHidden: Bool) -> ClukConfigurationsBuilder {
        builder.timeTextIsHidden = isHidden
        return builder
    }
}
