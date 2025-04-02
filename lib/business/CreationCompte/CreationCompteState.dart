class CreationCompteState {
    bool isLoading;
    String? errorMsg;
    bool ?   isSucces = false;

    CreationCompteState({
         this.isLoading = false,
         this.errorMsg,
         this.isSucces,
    });

    CreationCompteState copyWith({
        bool? isLoading,
        String? errorMsg,
        bool?   isSucces
    }) => 
        CreationCompteState(
            isLoading: isLoading ?? this.isLoading,
            errorMsg: errorMsg ?? this.errorMsg,
            isSucces:isSucces?? this.isSucces,
        );
}
