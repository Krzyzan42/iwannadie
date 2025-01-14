@testable import ultragarden
import XCTest
import SnapshotTesting

class SnapshotTests: XCTestCase {
    func test_calendar_view(){
        let view = AddPlantView(plant: get_plant(id: 0)).environmentObject(Calendar())
        assertSnapshot(of: view, as: .image)
    }
    
    func tet_home_view(){
        let view = HomeView().environmentObject(Calendar())
        assertSnapshot(of: view, as: .image)
    }
    
    func test_plant_detail_front(){
        let view = PlantDetailFront(plant: get_plant(id: 0)).environmentObject(Calendar())
        assertSnapshot(of: view, as: .image)
    }
    
    func test_plant_detail_back(){
        let view = PlantDetailBack(plant: get_plant(id: 0)).environmentObject(Calendar())
        assertSnapshot(of: view, as: .image)
    }
    
    func test_root_view(){
        let view = RootView().environmentObject(Calendar())
        assertSnapshot(of: view, as: .image)
    }
    
    func test_add_plant(){
        let view = AddPlantView(plant: get_plant(id: 0)).environmentObject(Calendar())
        assertSnapshot(of: view, as: .image)
    }
    
}

