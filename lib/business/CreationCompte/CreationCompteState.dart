
import 'dart:convert';

CreationCompteState creationCompteStateFromMap(String str) => CreationCompteState.fromMap(json.decode(str));

String creationCompteStateToMap(CreationCompteState data) => json.encode(data.toMap());

class CreationCompteState {
    String? name;
    String? email;
    String? password;
    bool? isLoading;
    String? messageError;

    CreationCompteState({
        this.name,
        this.email,
        this.password,
        this.isLoading,
        this.messageError,
    });

    CreationCompteState copyWith({
        String? name,
        String? email,
        String? password,
        bool? isLoading,
        String? messageError,
    }) => 
        CreationCompteState(
            name: name ?? this.name,
            email: email ?? this.email,
            password: password ?? this.password,
            isLoading: isLoading ?? this.isLoading,
            messageError: messageError ?? this.messageError,
        );

    factory CreationCompteState.fromMap(Map<String, dynamic> json) => CreationCompteState(
        name: json["name"],
        email: json["email"],
        password: json["password"],
        isLoading: json["isLoading"],
        messageError: json["messageError"],
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "email": email,
        "password": password,
        "isLoading": isLoading,
        "messageError": messageError,
    };
}
