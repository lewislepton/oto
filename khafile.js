let project = new Project('OTO');

project.addAssets('Assets/audio/**');
project.addAssets('Assets/font/**');
project.addAssets('Assets/image/**');

project.addShaders('Shaders/**');

project.addSources('Sources');

project.addLibrary('tanuki');

project.addParameter('-resource ../Assets/level/level0.json@level0');
project.addParameter('-resource ../Assets/level/level1.json@level1');
project.addParameter('-resource ../Assets/level/level2.json@level2');
project.addParameter('-resource ../Assets/level/level3.json@level3');
project.addParameter('-resource ../Assets/level/level4.json@level4');
project.addParameter('-resource ../Assets/level/level5.json@level5');
project.addParameter('-resource ../Assets/level/level6.json@level6');
project.addParameter('-resource ../Assets/level/level6.json@level6');
project.addParameter('-resource ../Assets/level/level6.json@level6');
project.addParameter('-resource ../Assets/level/level7.json@level7');
project.addParameter('-resource ../Assets/level/level8.json@level8');
project.addParameter('-resource ../Assets/level/level9.json@level9');
project.addParameter('-resource ../Assets/level/level10.json@level10');
project.addParameter('-resource ../Assets/level/level11.json@level11');
project.addParameter('-resource ../Assets/level/level12.json@level12');
project.addParameter('-resource ../Assets/level/level13.json@level13');
project.addParameter('-resource ../Assets/level/level14.json@level14');
project.addParameter('-resource ../Assets/level/level15.json@level15');
project.addParameter('-resource ../Assets/level/level16.json@level16');
project.addParameter('-resource ../Assets/level/level17.json@level17');
project.addParameter('-resource ../Assets/level/level18.json@level18');
project.addParameter('-resource ../Assets/level/level19.json@level19');
project.addParameter('-resource ../Assets/level/level20.json@level20');
project.addParameter('-resource ../Assets/level/level21.json@level21');
project.addParameter('-resource ../Assets/level/level22.json@level22');
project.addParameter('-resource ../Assets/level/level23.json@level23');
project.addParameter('-resource ../Assets/level/level24.json@level24');
project.addParameter('-resource ../Assets/level/level25.json@level25');
project.addParameter('-resource ../Assets/level/level26.json@level26');
project.addParameter('-resource ../Assets/level/level27.json@level27');
project.addParameter('-resource ../Assets/level/level28.json@level28');
project.addParameter('-resource ../Assets/level/level29.json@level29');
project.addParameter('-resource ../Assets/level/level30.json@level30');

// project.addDefine('debug_collision');

resolve(project);