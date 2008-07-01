/**
* ...
* @author Default
* @version 0.1
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
*/

package drawlogic.as3.threed.papervision3d {
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.ui.Keyboard;
	import flash.ui.Mouse;
	import org.papervision3d.cameras.FreeCamera3D;
	import org.papervision3d.materials.utils.MaterialsList;
	import org.papervision3d.materials.WireframeMaterial;
	import org.papervision3d.objects.DisplayObject3D;
	import org.papervision3d.objects.primitives.Cube;
	import org.papervision3d.objects.primitives.Sphere;
	import org.papervision3d.render.BasicRenderEngine;
	import org.papervision3d.scenes.Scene3D;
	import org.papervision3d.view.Viewport3D;
	
	[SWF(width="640", height="480", backgroundColor="0x000000", frameRate="31")]
	public class FPSMovement extends Sprite {
		
		private var viewport:Viewport3D;
		private var scene:Scene3D;
		private var camera:FreeCamera3D;
		private var renderer:BasicRenderEngine;
		
		public var inertia:Number = 3;
		public var movementFactor:Number = 100;
		
		private var keyRight:Boolean = false;
		private var keyLeft:Boolean = false;
		private var keyForward:Boolean = false;
		private var keyBackward:Boolean = false;
		
		private var forwardFactor:Number = 0;
		private var sideFactor:Number = 0;
		
		private const BOUNDS:Number = 50000;
		
		private var bullets:Array;
		
		public function Shooter() {
			pv3d();
			setupScene();
			addEventListeners();
		}
		
		private function pv3d():void {
			viewport = new Viewport3D();
			addChild(viewport);
			
			scene = new Scene3D();
			camera = new FreeCamera3D();
			renderer = new BasicRenderEngine();
		}
		
		private function setupScene():void {
			bullets = new Array();
			
			var materialsList:MaterialsList = new MaterialsList();
			materialsList.addMaterial(new WireframeMaterial(0x003300), "all");
			
			var insideTheBox:Cube = new Cube(materialsList, BOUNDS, BOUNDS, BOUNDS, 10, 10, 10, Cube.ALL);
			scene.addChild(insideTheBox);
			
			Mouse.hide();
		}
		
		private function addEventListeners():void {
			stage.addEventListener(MouseEvent.CLICK, onMouseClick);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onMouseClick(e:MouseEvent):void {
			var bullet:Sphere = new Sphere(new WireframeMaterial(0xcc0000), 50);
			bullet.copyPosition(camera);
			bullet.copyTransform(camera);
			bullet.moveForward(400);
			
			scene.addChild(bullet);
			
			bullets.push(bullet);
		}
		
		private function onKeyDown(e:KeyboardEvent):void {
			switch( e.keyCode ) {
				case "W".charCodeAt():
				case Keyboard.UP:
					keyForward = true;
					keyBackward = false;
				break;
	
				case "S".charCodeAt():
				case Keyboard.DOWN:
					keyBackward = true;
					keyForward = false;
				break;
	
				case "A".charCodeAt():
				case Keyboard.LEFT:
					keyLeft = true;
					keyRight = false;
				break;
	
				case "D".charCodeAt():
				case Keyboard.RIGHT:
					keyRight = true;
					keyLeft = false;
				break;
			}
		}
		
		private function onKeyUp(e:KeyboardEvent):void
		{
			switch( e.keyCode ){
				case "W".charCodeAt():
				case Keyboard.UP:
					keyForward = false;
				break;
	
				case "S".charCodeAt():
				case Keyboard.DOWN:
					keyBackward = false;
				break;
	
				case "A".charCodeAt():
				case Keyboard.LEFT:
					keyLeft = false;
				break;
	
				case "D".charCodeAt():
				case Keyboard.RIGHT:
					keyRight = false;
				break;
			}
		}
		
		private function onEnterFrame(e:Event):void {
			for each(var bullet:DisplayObject3D in bullets) {
				bullet.moveForward(100);
				if (Math.abs(bullet.x) > BOUNDS/2 || Math.abs(bullet.y) > BOUNDS/2 || Math.abs(bullet.z) > BOUNDS/2) {
					bullets.splice(bullets.indexOf(bullet), 1 );
					scene.removeChild(bullet);
				}
			}
			
			if(keyForward){
				forwardFactor += 50;
			}
			if(keyBackward){
				forwardFactor += -50;
			}
			if(keyLeft){
				sideFactor += -50;
			}
			if(keyRight){
				sideFactor += 50;
			}
			
			forwardFactor +=( 0-forwardFactor ) / inertia;
			sideFactor += ( 0 - sideFactor ) / inertia;
			
			if (forwardFactor > 0){
				camera.moveForward( forwardFactor );
			}else{
				camera.moveBackward( -forwardFactor );
			}
			
			if (sideFactor > 0){
				camera.moveRight( sideFactor );
			}else{
				camera.moveLeft( -sideFactor );
			}
			
			camera.rotationX = -(viewport.mouseY - stage.height / 2) / 5;
			camera.rotationY = (viewport.mouseX - stage.width / 2) / 5;

			renderer.renderScene(scene, camera, viewport);
		}
	}
}
