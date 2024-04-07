package org.example;

import org.example.Controller.PetController;
import org.example.Model.Pet;
import org.example.Services.IRepository;
import org.example.Services.PetRepository;
import org.example.UserInterface.ConsoleMenu;

public class Programm {
    public static void main(String[] args) throws Exception {

        IRepository<Pet> myFarm = new PetRepository();
        PetController controller = new PetController(myFarm);
        new ConsoleMenu(controller).start();
    }
}
