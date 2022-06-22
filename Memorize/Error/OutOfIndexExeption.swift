//
//  OutOfIndexExeption.swift
//  Memorize
//
//  Created by Robin Simonneau on 22/06/2022.
//

import Foundation


/*
 Gère les erreur en rapport avec la manipulation de listes
 indexNotInTheList est soulevé si un index n'est pas présent dans la liste
 */
enum OutOfIndexExeption:Error{
    case indexNotInTheList
}
