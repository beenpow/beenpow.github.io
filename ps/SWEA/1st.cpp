#include<iostream>
#include<string>
#include<vector>
#include<algorithm>
#include<iterator>
#include<dirent.h>
#include<sys/types.h>
using namespace std;

typedef std::vector<std::string> stringvec;
void read_directory(const std::string& name,stringvec& v)
{
    DIR* dirp = opendir(name.c_str());
    struct dirent * dp;
    while ((dp = readdir(dirp)) != NULL) {
	int i = 0;
	while(dp->d_name[i]) i++;

	if(dp->d_name[i-1] != 'd') continue;
	dp->d_name[i-3] = '\0';
        v.push_back(dp->d_name);
    }
    closedir(dirp);
}
int main()
{
    int NbOfComponents;
    stringvec v;
    std::string Ext = ".md";
    std::string Dir = "/Users/beenpow/Desktop/backup_for_blog/_posts/SWEA/";
    std::string command = "ls -l "+Dir+"*"+Ext;//+"|wc -l";
    const char *Command = command.c_str();
    NbOfComponents = system(Command);
    read_directory(Dir,v);
    //std::cout<<"The geometry is composed by "<<NbOfComponents<<" parts"<<std::endl;
    //std::copy(v.begin(),v.end(),std::ostream_iterator<std::string>(std::cout,"\n"));
    cout << "THERE YOU GO\n";
    cout << v.size() << endl;

    sort(v.begin(), v.end());
//for(int i = 0; i < v.size(); i++) cout << v[i] << '\n';

    int j = 1;
    for(int i = 0; i < v.size(); i++){
	      cout << v[i] << '\n';
	      string newpath = Dir + v[i] + '/';
	      string cmd = "mkdir " + v[i];
	      system(cmd.c_str());
	
	      cmd = "mv " + v[i]+".md" + " " + newpath;
	      system(cmd.c_str());

	      cmd = "mkdir " + v[i] + '/' + "img";
	      system(cmd.c_str());

	      string imagepath = Dir + "images/";
	      cmd = v[i] + '/' + "img";
	      cmd = "cp "+ imagepath + to_string(j) + ".jpg" + " " + cmd + '/' + to_string(1) + ".jpg";
	      cout << cmd << ", j : " << j << '\n';
	      system(cmd.c_str());

	      ++j;
	      if(j == 78) j = 1;
    }

    return 0;
}
