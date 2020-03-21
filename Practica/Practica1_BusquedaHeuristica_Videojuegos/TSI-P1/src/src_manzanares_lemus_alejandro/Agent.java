package src_manzanares_lemus_alejandro;

import core.game.Observation;
import core.game.StateObservation;
import core.player.AbstractPlayer;
import ontology.Types;
import tools.ElapsedCpuTimer;
import tools.Vector2d;

import java.util.*;

import static java.util.Collections.*;
import static ontology.Types.*;

public class Agent extends AbstractPlayer {
  Vector2d fescala;
  Vector2d portal;
  ArrayList<ACTIONS> ruta = new ArrayList<ACTIONS>();

  public Agent(StateObservation stateObs, ElapsedCpuTimer elapsedTimer){
    fescala = new Vector2d(stateObs.getWorldDimension().width / stateObs.getObservationGrid().length ,
            stateObs.getWorldDimension().height / stateObs.getObservationGrid()[0].length);

    //Se crea una lista de observaciones de portales, ordenada por cercania al avatar
    ArrayList<Observation>[] posiciones = stateObs.getPortalsPositions(stateObs.getAvatarPosition());
    //Seleccionamos el portal mas proximo
    portal = posiciones[0].get(0).position;
    portal.x = Math.floor(portal.x / fescala.x);
    portal.y = Math.floor(portal.y / fescala.y);

    System.out.print("Mundo: ");
    System.out.print(stateObs.getObservationGrid().length);
    System.out.print(" x ");
    System.out.println(stateObs.getObservationGrid()[0].length);
  }

  public void init(StateObservation stateObs, ElapsedCpuTimer elapsedTimer){

  }

  public boolean misma_orientacion_accion(Vector2d orientacion, ACTIONS accion){
    if(accion == ACTIONS.ACTION_RIGHT && orientacion.x == 1.0){
      return true;
    } else if (accion == ACTIONS.ACTION_LEFT && orientacion.x == -1.0){
      return true;
    } else if (accion == ACTIONS.ACTION_UP && orientacion.y == -1.0){
      return true;
    } else if (accion == ACTIONS.ACTION_DOWN && orientacion.y == 1.0){
      return true;
    } else {
      return false;
    }
  }

  public ArrayList<ACTIONS> A_estrella (Vector2d destino, StateObservation stateObs, ElapsedCpuTimer elapsedTimer){
    ArrayList<Node> abiertos = new ArrayList<Node>();
    ArrayList<Node> cerrados = new ArrayList<Node>();
    ArrayList<ACTIONS> path = new ArrayList<ACTIONS>();
    ArrayList<Observation>[][] obv = stateObs.getObservationGrid();
    ArrayList<ACTIONS> acciones = stateObs.getAvailableActions();
    Vector2d pos_inicial = new Vector2d(stateObs.getAvatarPosition().x / fescala.x, stateObs.getAvatarPosition().y / fescala.y);
    Vector2d ori_inicial = new Vector2d(stateObs.getAvatarOrientation());
    Node padre = new Node(stateObs, ori_inicial,pos_inicial,destino,path);
    Node actual;
    boolean fin= false;
    boolean encontrado = false;

    abiertos.add(padre);
    //System.out.println(padre.toString());
    stateObs.advance(ACTIONS.ACTION_NIL);

    System.out.print("Portal: (");
    System.out.print(destino.x);
    System.out.print(", ");
    System.out.print(destino.y);
    System.out.println(")");
    do{
      actual = abiertos.get(0);
      cerrados.add(actual);
      abiertos.remove(0);

      for(int i = 0; i < acciones.size(); i++){
        //System.out.println(acciones.get(i));
        Vector2d new_pos = new Vector2d(actual.getPosicion());
        Vector2d new_ori = new Vector2d(actual.getOrientacion());
        Types.ACTIONS elegida;
        if (acciones.get(i) != ACTIONS.ACTION_USE){
          if (acciones.get(i) == ACTIONS.ACTION_RIGHT) {
            new_pos.x = new_pos.x + 1;
          } else if (acciones.get(i) == ACTIONS.ACTION_LEFT) {
            new_pos.x = new_pos.x - 1;
          } else if (acciones.get(i) == ACTIONS.ACTION_UP) {
            new_pos.y = new_pos.y - 1;
          } else if (acciones.get(i) == ACTIONS.ACTION_DOWN) {
            new_pos.y = new_pos.y + 1;
          }
          int tipo = (obv[(int) new_pos.x][(int) new_pos.y]).get(0).itype;
          if(tipo != 0) {
            ArrayList<ACTIONS> camino_actual = new ArrayList<ACTIONS>(actual.getAccion());
            camino_actual.add(acciones.get(i));
            if(!misma_orientacion_accion(new_ori,acciones.get(i))){
              camino_actual.add(acciones.get(i));
            }
            if (acciones.get(i) == ACTIONS.ACTION_RIGHT) {
              new_ori.x = 1;
              new_ori.y = 0;
            } else if (acciones.get(i) == ACTIONS.ACTION_LEFT) {
              new_ori.x = -1;
              new_ori.y = 0;
            } else if (acciones.get(i) == ACTIONS.ACTION_UP) {
              new_ori.x = 0;
              new_ori.y = -1;
            } else if (acciones.get(i) == ACTIONS.ACTION_DOWN) {
              new_ori.x = 0;
              new_ori.y = 1;
            }
            Node hijo = new Node(stateObs, new_ori, new_pos, destino, camino_actual);
            encontrado = false;
            for(int j = 0; j < cerrados.size() && !encontrado; j++){
              if(hijo.equals(cerrados.get(j))){
                encontrado = true;
              }
            }
            if(!encontrado){
              abiertos.add(hijo);
            }
          }
        }
      }
      sort(abiertos);
    }while(actual.getTipo() != 5 && elapsedTimer.remainingTimeMillis() > 0);

    //System.out.println(actual.toString());

    path = new ArrayList<ACTIONS>(actual.getAccion());
    System.out.println(elapsedTimer.elapsedMillis());
    System.out.println(elapsedTimer.remainingTimeMillis());

    return path;
  }

  public ACTIONS act( StateObservation stateObs, ElapsedCpuTimer elapsedTimer) {
    if(ruta.size() == 0){
      ruta = new ArrayList<ACTIONS>(A_estrella(portal,stateObs,elapsedTimer));
    }
    ACTIONS accion = ruta.get(0);
    //System.out.println(ruta.get(0));
    ruta.remove(0);
    return accion;
  }
}
