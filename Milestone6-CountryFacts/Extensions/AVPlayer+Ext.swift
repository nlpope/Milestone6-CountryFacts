//  File: AVPlayer+Ext.swift
//  Project: Milestone6-CountryFacts
//  Created by: Noah Pope on 6/4/25.

import AVKit
import AVFoundation

extension AVPlayer
{
    var isPlaying: Bool { return rate != 0 && error == nil }
}
