#include <iostream>
#include <cmath>
#include <fstream>
#include <string>

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
