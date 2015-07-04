//
//  main.cpp
//  SoundGeneration
//
//  Created by Vaish Raman (and Justin Morrow :P ) on 3/23/15.
//  Copyright (c) 2015 Vaish Raman. All rights reserved.
//

#include <iostream>
#include <cmath>
#include <fstream>
#include <string>
#include <cstdlib>

using namespace std;
int main(int argc, const char * argv[]) {
    double A = 214748364;
    double theta = 0;
    const double PI = 3.14159;
    int count = 0;
    string note = "";
    string filename = "";
    string soundvar = "";
    string sizevar = "";

    theta = atof(argv[1]);
    note = argv[2];

/*
    cout << "Input desired frequency in Hz: ";
    cin >> theta;
    cout << endl;
    cout << "Input note letter and number (eg C4):";
    cin >> note;
    cout << endl;
*/

    //Update string names
    filename = note;
    filename.append(".e");
    soundvar = note;
    soundvar.append("_sound");
    sizevar = note;
    sizevar.append("_size");

    //Open file stream and write first line
    ofstream outFile(filename.c_str());
    outFile << soundvar;
    cout << soundvar;

    for (double i = 0; i <= (1 / theta); i = i + 0.000125) {
        cout << "              .data    ";
        cout << fixed << int(A * sin(theta * 2 * PI * i)) << endl;

        outFile << "              .data    ";
        outFile << fixed << int(A * sin(theta * 2 * PI * i)) << endl;

        ++count;
    }

    outFile << sizevar << "    .data    " << count << endl;
    cout << sizevar << "    .data    " << count << endl;
}
