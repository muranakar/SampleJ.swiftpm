import UIKit

var greeting = "Hello, playground"


struct MockPokemonAPI {
    enum ResultPokemon {
        case resultPokemonList(Result<PokemonList,WebApiError>)
        case resultPokemonDetail(Result<PokemonDetail,WebApiError>)
    }
    var resultPokemon: ResultPokemon

}


struct PokemonList {
}

struct PokemonDetail {
}

enum WebApiError: Error {
    /// トークンが不正
    case invalidToken
    /// パラメータが不正
    case invalidParameters
    /// ユーザが見つからない
    case userNotFound
}

let mock = MockPokemonAPI(
    resultPokemon:
            .resultPokemonList(.failure(.invalidToken))
)


mock.resultPokemon

switch mock.resultPokemon {
case .resultPokemonList(let result):
    switch result {
    case .success(let PokemoList):
        print(PokemoList)
    case .failure(let error):
        print(error)
    }
case .resultPokemonDetail(let result):
    switch result {
    case .success(let PokemoDetail):
        print(PokemoDetail)
    case .failure(let error):
        print(error)
    }
}



