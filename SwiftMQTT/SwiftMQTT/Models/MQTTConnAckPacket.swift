//
//  MQTTConnAckPacket.swift
//  SwiftMQTT
//
//  Created by Ankit Aggarwal on 12/11/15.
//  Copyright © 2015 Ankit. All rights reserved.
//

import Foundation

class MQTTConnAckPacket: MQTTPacket {
    
    let sessionPresent: Bool
    let response: MQTTConnAckResponse
    
    init(header: MQTTPacketFixedHeader, networkData: Data) {
        sessionPresent = networkData.isEmpty ? false : (networkData[0] & 0x01) == 0x01
        response = MQTTConnAckResponse(rawValue: networkData.isEmpty ? 1 : networkData[1])!
        
        super.init(header: header)
    }
}
